/*
    Copyright 2019 Joel Svensson	svenssonjoel@yahoo.se

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

#include "dcdc.h"

static unsigned char dcdc_vsel; 

static adcsample_t samples[2];

static unsigned int input_vsense = 0;
static unsigned int rail_vsense = 0; 


/* ================================================= */
/*  ADC Channels on the z-SIM board                  */
/*  PA0 */
/*  */
/*  */

/*
static void adccallback(ADCDriver *adcp) {

  (void) adcp;
  //(void) buffer;
  //(void) n;

  // Hack... TODO: figure out how to do this.. 
  input_vsense = samples[0];
  rail_vsense  = samples[1]; 
  
}


static const ADCConversionGroup adcgrpcfg = {
  TRUE, // TODO: Lookup what this means
  2,    // Number of ADC channels
  adccallback, // the callback above
  0, // error callback
  0, // CR1
  ADC_CR2_SWSTART, // CR2
  0, // SMPR1 (CHANNEL X sampling time for x >= 10) 
  ADC_SMPR2_SMP_AN2(ADC_SAMPLE_56) |
  ADC_SMPR2_SMP_AN3(ADC_SAMPLE_56), // SMPR2   ??? (CHANNEL X sampling time for x < 10)
  0, // watchdog htr
  0, // watchdog ltr
  2, // SQR1: Number of conversions
  0, // SQR2: Sequence for channel >= 10 
  ADC_SQR3_SQ2_N(ADC_CHANNEL_IN3) | ADC_SQR3_SQ1_N(ADC_CHANNEL_IN2)
}; 
*/

  
/*===========================================================================*/
/* ADC related code based on demo                                            */
/* https://www.playembedded.org/blog/reading-a-slider/                       */
/*===========================================================================*/
/*
 * In this demo we want to use a single channel to sample voltage across
 * the potentiometer.
 */
#define MY_NUM_CH                                              1
#define MY_SAMPLING_NUMBER                                     1

static adcsample_t sample_buff[MY_NUM_CH * MY_SAMPLING_NUMBER];

/*
 * ADC conversion group.
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
  FALSE,                            /*NOT CIRCULAR*/
  MY_NUM_CH,                        /*NUMB OF CH*/
  NULL,                             /*NO ADC CALLBACK*/
  NULL,                             /*NO ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_SWSTART,                  /* CR2 */
  0,                                /* SMPR1 */
  ADC_SMPR2_SMP_AN0(ADC_SAMPLE_144),/* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN0)  /* SQR3 */
};

static const ADCConversionGroup ADC2_conversion_group = {
  FALSE,                            /*NOT CIRCULAR*/
  MY_NUM_CH,                        /*NUMB OF CH*/
  NULL,                             /*NO ADC CALLBACK*/
  NULL,                             /*NO ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_SWSTART,                  /* CR2 */
  0,                                /* SMPR1 */
  ADC_SMPR2_SMP_AN1(ADC_SAMPLE_144),/* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN1)  /* SQR3 */
};

static const ADCConversionGroup ADC3_conversion_group = {
  FALSE,                            /*NOT CIRCULAR*/
  MY_NUM_CH,                        /*NUMB OF CH*/
  NULL,                             /*NO ADC CALLBACK*/
  NULL,                             /*NO ADC ERROR CALLBACK*/
  0,                                /* CR1 */
  ADC_CR2_SWSTART,                  /* CR2 */
  0,                                /* SMPR1 */
  ADC_SMPR2_SMP_AN2(ADC_SAMPLE_144),/* SMPR2 */
  0,                                /* HTR */
  0,                                /* LTR */
  0,                                /* SQR1 */
  0,                                /* SQR2 */
  ADC_SQR3_SQ1_N(ADC_CHANNEL_IN2)  /* SQR3 */
};

 

void dcdc_init(void) {

  dcdc_vsel = 1; 

  // Analog inputs
  palSetPadMode(INPUT_VSENSE_GPIO,
		INPUT_VSENSE_PIN,
		PAL_MODE_INPUT_ANALOG);
  palSetPadMode(RAIL_VSENSE_GPIO,
		RAIL_VSENSE_PIN,
		PAL_MODE_INPUT_ANALOG);
  // TODO: Enable ADC (Cannot find any "understandable" example)
  // 
  // ADC123_IN2 - GPIOA pin 2
  // ADC123_IN3 - GPIOA pin 3

  adcStart(&ADCD1, NULL);
  adcStartConversion(&ADCD1, &adcgrpcfg, samples, 2);
  
  // Digital outputs
  palSetPadMode(VSEL_GPIO,
		VSEL_1_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_2_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_3_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_4_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_5_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  

  palSetPadMode(DCDC_OUTPUT_ENABLE_GPIO,
		DCDC_OUTPUT_ENABLE_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      0);
  

  palWritePad(VSEL_GPIO, VSEL_1_PIN, dcdc_vsel & 1);
  palWritePad(VSEL_GPIO, VSEL_2_PIN, (dcdc_vsel >> 1) & 1);
  palWritePad(VSEL_GPIO, VSEL_3_PIN, (dcdc_vsel >> 2) & 1);
  palWritePad(VSEL_GPIO, VSEL_4_PIN, (dcdc_vsel >> 3) & 1);
  palWritePad(VSEL_GPIO, VSEL_5_PIN, (dcdc_vsel >> 4) & 1);

}

bool dcdc_vsel_set(unsigned char vsel) {

  if (!(vsel & 0x1F)) return false;

  dcdc_vsel = vsel;

  palWritePad(VSEL_GPIO, VSEL_1_PIN, dcdc_vsel & 1);
  palWritePad(VSEL_GPIO, VSEL_2_PIN, (dcdc_vsel >> 1) & 1);
  palWritePad(VSEL_GPIO, VSEL_3_PIN, (dcdc_vsel >> 2) & 1);
  palWritePad(VSEL_GPIO, VSEL_4_PIN, (dcdc_vsel >> 3) & 1);
  palWritePad(VSEL_GPIO, VSEL_5_PIN, (dcdc_vsel >> 4) & 1);

  return true; 
}


bool dcdc_enable(void) {

  if (!(dcdc_vsel & 0x1F)) return false;

  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      1);
  
  return true; 
}

void dcdc_disable(void) {
  
  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      0);
  
}
