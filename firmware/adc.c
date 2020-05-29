/*
    Copyright 2019/2020   Joel Svensson	svenssonjoel@yahoo.se
                          Anders Thorsén thorsenanders@yahoo.com


    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "adc.h"

bool flag_ADC2 = FALSE;
bool flag_ADC3 = FALSE;
float mean_ADC_I_SENSE_AC;
float mean_ADC_I_SENSE_4T_AC;
int32_t lastvalue_ADC2;
int32_t lastvalue_ADC3;
float prevmean_ADC_I_SENSE_AC;
float prevmean_ADC_I_SENSE_4T_AC;
float intmean_ADC_I_SENSE_AC = 0;
float intmean_ADC_I_SENSE_4T_AC = 0;
float dmean_ADC_I_SENSE_AC_dt;
float dmean_ADC_I_SENSE_4T_AC_dt;

// For debugging
float mean_ADC_I_SENSE;
float mean_ADC_I_SENSE_4T;
// End for debugging

float Rload = 1, Lload =0 , Cload = 100;
uint16_t loadConfig = RESISTIVE; //IDUCTIVE, CAPACITIVE


/*===========================================================================*/
/*GPT3 configuration. Used for trigging the ADC.                             */
/*===========================================================================*/

static const GPTConfig gpt3cfg1 = {
  frequency:  gpt3Freq,  //1000000U,       // 1 MHz I think
  callback:   NULL,
  cr2:        TIM_CR2_MMS_1,  // MMS = 010 = TRGO on Update Event
  dier:       0U
};


/*===========================================================================*/
/* ADC related code based on demo                                            */
/* https://www.playembedded.org/blog/reading-a-slider/                       */
/* http://www.playembedded.org/blog/wp-content/uploads/2018/05/RT-STM32F401RE-NUCLEO64-GPT-ADC-182.zip */
/*===========================================================================*/
/*
 * In this demo we want to use a single channel to sample voltage across
 * the potentiometer.
 */
#define MY_NUM_CH_ADC1  2
#define MY_NUM_CH_ADC2  2
#define MY_NUM_CH_ADC3  2
#define MY_SAMPLING_NUMBER_ADC1  4  //Min 2 in contnous mode?
#define MY_SAMPLING_NUMBER_ADC2  1
#define MY_SAMPLING_NUMBER_ADC3  1

int32_t buffer_size_ADC1 = MY_NUM_CH_ADC1 * MY_SAMPLING_NUMBER_ADC1;
int32_t buffer_size_ADC2 = MY_NUM_CH_ADC2 * MY_SAMPLING_NUMBER_ADC2;
int32_t buffer_size_ADC3 = MY_NUM_CH_ADC3 * MY_SAMPLING_NUMBER_ADC3;

static adcsample_t sample_buff_ADC1[MY_NUM_CH_ADC1 * MY_SAMPLING_NUMBER_ADC1];
static adcsample_t sample_buff_ADC2[MY_NUM_CH_ADC2 * MY_SAMPLING_NUMBER_ADC2];
static adcsample_t sample_buff_ADC3[MY_NUM_CH_ADC3 * MY_SAMPLING_NUMBER_ADC3];

float ADC1Freq = ((float) gpt3Freq) /((float) ADC1_periods);



float R_voltage(float current, float resistance) {

   return 1000*current*(resistance-Rshunt);
}

float C_voltage(float current, float Ii_t_ack, float capacitance) {

    return 1/capacitance*Ii_t_ack-current*Rshunt;
}


float L_voltage(float current, float prevCurrent, float inductance, float resistance, float dt) {

    return current*(resistance-Rshunt) + inductance*(current-prevCurrent/dt);
}

float uIn(float iIn, float diIndt, float intIn) {

  switch (loadConfig) {
    case RESISTIVE:
      return Rload*iIn;
    case INDUCTIVE:
      return Rload*iIn+ Lload*diIndt;
    case CAPACITIVE:
      return 0; //TBD
  }
  return 0;
}



float uOPp2p(float ADCvalue_AC, float dADCvalue_AC_dt, float intADCvalue_AC) {
  float uRshunt, duRshuntdt, int_uRshunt, iRshunt, diRshuntdt, int_iRshunt;
  uRshunt = UADCmax/GainCurrentShunt*(ADCvalue_AC/ADCmax);
  iRshunt = uRshunt/Rshunt;
  duRshuntdt = UADCmax/GainCurrentShunt*(dADCvalue_AC_dt/ADCmax);
  diRshuntdt = duRshuntdt/Rshunt;
  int_uRshunt = UADCmax/GainCurrentShunt*(intADCvalue_AC/ADCmax);
  int_iRshunt = int_uRshunt/Rshunt;

  return (uIn(iRshunt, diRshuntdt, int_iRshunt)-uRshunt);
}

uint16_t loadConfig;
/*
* ADC streaming callback
*/
 /*
  * From https://github.com/resset/STM32F4-Discovery-example-code/blob/master/myADC.c
  * This callback is called everytime the buffer is filled or half-filled
  * A second ring buffer is used to store the averaged data.
  * I should use a third buffer to store a timestamp when the buffer was filled.
  * I hope I understood how the Conversion ring buffer works...
  *
  *
  * Also base don th GPT-ADC example in ChibiOS
  */


static void adccallback(ADCDriver *adcp) {

  unsigned int i,j;
  uint32_t sum_ADC_I_SENSE=0;
  uint32_t sum_ADC_I_SENSE_4T=0;
  //float mean_ADC_I_SENSE, mean_ADC_I_SENSE_4T;

  if (adcIsBufferComplete(adcp)) {
    j=buffer_size_ADC1/2;  // Upper part of buffer
  }
  else {
    j=0;  //Lower part of buffer
  }

  for (i=0; i< MY_SAMPLING_NUMBER_ADC1/2;i++){
    sum_ADC_I_SENSE += sample_buff_ADC1[j+i*MY_NUM_CH_ADC1+1];
    sum_ADC_I_SENSE_4T += sample_buff_ADC1[j+i*MY_NUM_CH_ADC1+0];
  }

  mean_ADC_I_SENSE = ((float) sum_ADC_I_SENSE) / ((float) MY_SAMPLING_NUMBER_ADC1/2);
  mean_ADC_I_SENSE_4T = ((float) sum_ADC_I_SENSE_4T) / ((float) MY_SAMPLING_NUMBER_ADC1/2);

  prevmean_ADC_I_SENSE_AC = mean_ADC_I_SENSE_AC;
  prevmean_ADC_I_SENSE_4T_AC = mean_ADC_I_SENSE_4T_AC;
  mean_ADC_I_SENSE_AC = mean_ADC_I_SENSE - (float) ADCmax/2;
  mean_ADC_I_SENSE_4T_AC = mean_ADC_I_SENSE_4T - (float) ADCmax/2;

  dmean_ADC_I_SENSE_AC_dt = (mean_ADC_I_SENSE_AC-prevmean_ADC_I_SENSE_AC)*ADC1Freq;
  dmean_ADC_I_SENSE_4T_AC_dt = (mean_ADC_I_SENSE_4T_AC-prevmean_ADC_I_SENSE_4T_AC)*ADC1Freq;

  intmean_ADC_I_SENSE_AC += (mean_ADC_I_SENSE_AC+prevmean_ADC_I_SENSE_AC)/2 * (1/ADC1Freq);
  intmean_ADC_I_SENSE_4T_AC += (mean_ADC_I_SENSE_4T_AC+prevmean_ADC_I_SENSE_4T_AC)/2 * (1/ADC1Freq);

  dacOutput(uOPp2p(mean_ADC_I_SENSE_4T_AC, dmean_ADC_I_SENSE_4T_AC_dt, intmean_ADC_I_SENSE_4T_AC));

}

/*
 * ADC errors callbaack, should never happen.
 */
static void adcerrorcallback(ADCDriver *adcp, adcerror_t err) {

  (void)adcp;
  (void)err;
}


/*
 * ADC conversion group3, one for each ADC
 * Mode:        Linear buffer, 10 samples of 1 channel, SW triggered.
 * Channels:
 * ADC123 IN0  (PA0) = PA0_SHUNT1 = I_SENSE, TP_I1
 * ADC123 IN1  (PA1) = PA1_SHUNT2 = I_SENSE_4T, TP_I2
 * ADC123 IN2  (PA2) = PA2_DCDC_RAIL = RAIL_DIV
 * ADC123 IN3  (PA3) = PA3_DCDC_IN = PWR_DIV
 * (ADC12  IN4  (PA4) = PA4_DAC1)
 * (ADC12  IN5  (PA5) = PA5_DAC2)
 * (ADC12  IN6  (PA6) = PA6_ES1)
 * (ADC12  IN7  (PA7) = PA7_ES2)
 * (ADC12  IN8  (PB0) = PB0_LED_GREEM)
 * (ADC12  IN9  (PB1) = PB1_LED_RED)
 * ADC123 IN10 (PC0) = PC0_TEMP1 = TEMP1_J2
 * ADC123 IN11 (PC1) = PC1_TEMP2 = TEMP1_J3
 * ADC123 IN12 (PC2) = PC2_ADC123_12 = ADC_EXTRA_PIN2
 * ADC123 IN13 (PC3) = PC3_ADC123_13 = ADC_EXTRA_PIN3
 * (ADC12  IN14 (PC4) = NC)
 * (ADC12  IN15 (PC5) = NC)
 * ADC1   SENSOR = Internal Temperature sensor
 * ADC1   VREFINT =Internal reference)
 * ADC1   VBAT = VBAT
 */
static const ADCConversionGroup ADC1_conversion_group = {
  TRUE,                            /*NOT CIRCULAR*/
  MY_NUM_CH_ADC1,                  /*NUMB OF CH*/
  adccallback,                     /* ADC CALLBACK*/
  adcerrorcallback,                 /*ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_EXTEN_0 | ADC_CR2_EXTSEL_3,  /* CR2 */
  0,                                /* SMPR1 */
  ADC_SMPR2_SMP_AN0(ADC_SAMPLE_3)|
  ADC_SMPR2_SMP_AN1(ADC_SAMPLE_3),/* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN0)|  /* SQR3 */ /*I_SENSE*/
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN1)   /* SQR3 */ /*I_SENSE_4T*/
};

static const ADCConversionGroup ADC2_conversion_group = {
  FALSE,                            /*NOT CIRCULAR*/
  MY_NUM_CH_ADC2,                        /*NUMB OF CH*/
  NULL,                             /*NO ADC CALLBACK*/
  NULL,                             /*NO ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_SWSTART,                  /* CR2 */
  0,                                /* SMPR1 */
  ADC_SMPR2_SMP_AN2(ADC_SAMPLE_3) |
  ADC_SMPR2_SMP_AN3(ADC_SAMPLE_3),  /* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN2) |             /*RAIL_DIV*/
  ADC_SQR3_SQ2_N(ADC_CHANNEL_IN3)  /* SQR3 */   /*PWR_DIV*/
};

static const ADCConversionGroup ADC3_conversion_group = {
  FALSE,                            /*NOT CIRCULAR*/
  MY_NUM_CH_ADC3,                        /*NUMB OF CH*/
  NULL,                             /*NO ADC CALLBACK*/
  NULL,                             /*NO ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_SWSTART,                  /* CR2 */
  ADC_SMPR1_SMP_AN12(ADC_SAMPLE_3) |
  ADC_SMPR1_SMP_AN13(ADC_SAMPLE_3),  /* SMPR1 */
  0,                                /* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN12) |              /*ADC_EXTRA_PIN2*/
  ADC_SQR3_SQ2_N(ADC_CHANNEL_IN13)  /* SQR3 */    /*ADC_EXTRA_PIN3*/
};

/*===========================================================================*/
/*  ADC1 thread                                                              */
/*===========================================================================*/

static THD_WORKING_AREA(waThdADC1, 512);
  static THD_FUNCTION(ThdADC1, arg) {
  (void) arg;
  chRegSetThreadName("ADC1 handler");

  // Starting GPT3 driver used for triggig the ADC1
  gptStart(&GPTD3, &gpt3cfg1);

  /*
    * Activates the ADC1 driver.
    */
  adcStart(&ADCD1, NULL);

//  Strats an ADC contnous conversion trigged with a period of 1/10000 second
  adcStartConversion(&ADCD1, &ADC1_conversion_group, sample_buff_ADC1, MY_SAMPLING_NUMBER_ADC1);
  gptStartContinuous(&GPTD3, ADC1_periods);

}

/*===========================================================================*/
/*  ADC2 thread                                                              */
/*===========================================================================*/

static THD_WORKING_AREA(waThdADC2, 512);
  static THD_FUNCTION(ThdADC2, arg) {
  unsigned ii;
  int32_t mean;
  (void) arg;
  chRegSetThreadName("ADC2 handler");
  /*
    * Activates the ADC2 driver.
    */
  adcStart(&ADCD2, NULL);
  while(TRUE) {
    adcConvert(&ADCD2, &ADC2_conversion_group, sample_buff_ADC2, MY_SAMPLING_NUMBER_ADC2);

    /* Making mean of sampled values. Note that samples refers to OTA and OTB
        but since they we are looking for Rcm (common mode) we can make a simple
        mean */
    mean = 0;
    for (ii = 0; ii < MY_NUM_CH_ADC2 * MY_SAMPLING_NUMBER_ADC2; ii++) {
      mean += sample_buff_ADC2[ii];
    }
    mean /= MY_NUM_CH_ADC2 * MY_SAMPLING_NUMBER_ADC2;
//    lastvalue_ADC2 = (float)mean;
//    lastvalue_ADC2 = (int32_t)sample_buff_ADC2[0];
    lastvalue_ADC2 = (int32_t)mean;
    flag_ADC2 = TRUE;
  }
}

/*===========================================================================*/
/*  ADC3 thread                                                              */
/*===========================================================================*/
static THD_WORKING_AREA(waThdADC3, 512);
  static THD_FUNCTION(ThdADC3, arg) {
  unsigned ii;
  float mean;
  (void) arg;
  chRegSetThreadName("ADC3 handler");
  /*
    * Activates the ADC3 driver.
    */
  adcStart(&ADCD3, NULL);
  while(TRUE) {
    adcConvert(&ADCD3, &ADC3_conversion_group, sample_buff_ADC3, MY_SAMPLING_NUMBER_ADC3);

    /* Making mean of sampled values. Note that samples refers to OTA and OTB
        but since they we are looking for Rcm (common mode) we can make a simple
        mean */
    mean = 0;
    for (ii = 0; ii < MY_NUM_CH_ADC3 * MY_SAMPLING_NUMBER_ADC3; ii++) {
      mean += sample_buff_ADC3[ii];
    }
    mean /= MY_NUM_CH_ADC3 * MY_SAMPLING_NUMBER_ADC3;
//    lastvalue_ADC3 = (float)mean;
    lastvalue_ADC3 = (int32_t)sample_buff_ADC3[0];
    flag_ADC3 = TRUE;
  }
}


void adc_init(void) {


  // Analog inputs

  palSetPadMode(ADC_SHUNT_GPIO, I_SENSE_PIN, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(ADC_SHUNT_GPIO, I_SENSE_4T_PIN, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(ADC_DCDC_GPIO, RAIL_DIV_PIN, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(ADC_DCDC_GPIO, PWR_DIV_PIN, PAL_MODE_INPUT_ANALOG);

  palSetPadMode(ADC_EXTRA_GPIO, ADC_EXTRA1_PIN, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(ADC_EXTRA_GPIO, ADC_EXTRA2_PIN, PAL_MODE_INPUT_ANALOG);

  chThdCreateStatic(waThdADC1, sizeof(waThdADC1), NORMALPRIO, ThdADC1, NULL);
//  chThdCreateStatic(waThdADC2, sizeof(waThdADC2), NORMALPRIO, ThdADC2, NULL);
//  chThdCreateStatic(waThdADC3, sizeof(waThdADC3), NORMALPRIO, ThdADC3, NULL);

}
