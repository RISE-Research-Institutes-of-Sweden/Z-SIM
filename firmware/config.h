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

#ifndef _CONFIG_H_
#define _CONFIG_H_

#define zSIM TRUE
//#define STM32F4DISC TRUE

//#define FourTused TRUE

// Harware Configuration
#define Rshunt 10.0e-3 //Ohm
#define UADCmax 3.3 //Volt
#define GainCurrentShunt 20 //V/V
#define ADCmax 4095
#define DACmax 4095
#define UDACmax 3.3 //Volt
#define GainOP 2

// HW Pin Configuration
/*
 * Channels:                        Z-SIM                   DISCOVERY
 * PA0_SHUNT1 = I_SENSE, TP_I1:     PA0: ADC123 IN0
 * PA1_SHUNT2 = I_SENSE_4T, TP_I2:  PA1: ADC123 IN1
 * PA2_DCDC_RAIL = RAIL_DIV:        PA2: ADC123 IN2
 * PA3_DCDC_IN = PWR_DIV:           PA3: ADC123 IN3
 * PA4_DAC1:                        PA4:
 * PA5_DAC2:                        PA5:
 * PA6_ES1:                         PA6: ADC12 IN6
 * PA7_ES2:                         PA7: ADC12 IN7
 * PB0_LED_GREEN:                   PB0:
 * PB1_LED_RED:                     PB1:
 * PC0_TEMP1 = TEMP1_J2:            PC0: ADC123 IN10
 * PC1_TEMP2 = TEMP1_J3:            PC1: ADC123 IN11
 * ADC_EXTRA_PIN2:                  PC2: ADC123 IN12
 * ADC_EXTRA_PIN3:                  PC3: ADC123 IN13
 * NC:                              PC4: ADC12 IN14
 * NC:                              PC5: ADC12 IN15
 * SENSOR = Internal Temperature sensor:    ADC1
 * VREFINT =Internal reference:             ADC1
 * VBAT:                                    ADC1
 */




// Group A
// Group A ADCs
#define ADC_SHUNT_GPIO  GPIOA
#define I_SENSE_PIN     0
#define I_SENSE_4T_PIN  1
#define ADC_DCDC_GPIO   GPIOA
#define RAIL_DIV_PIN    2
#define PWR_DIV_PIN     3
#define OP_ES_GPIO      GPIOA
#define OP_ES1_PIN      6
#define OP_ES2_PIN      7

// Group A DACs
#define DAC_GPIO         GPIOA
#define DAC1_PIN        4
#define DAC2_PIN        5

// GPIO
// No pins used as GPIO

// Group B
// No ADCs used

//GPIO
#ifdef zSIM
// HW Pin Configuration z-SIM
#define LED_GPIO   GPIOB
#define LED_RED_PIN     0
#define LED_GREEN_PIN   1
#endif //zSIM

#ifdef STM32F4DISC
// HW Pin Configuration STM32F4DICOVERY

#define LED_GPIO   GPIOD
#define LED_RED_PIN     GPIOD_LED5
#define LED_GREEN_PIN   GPIOD_LED4

#endif //STM32F4DISC

// Group C
// Group C ADCs
#define ADC_TEMP_GPIO   GPIOC
#define TEMP1_PIN    0
#define TEMP2_PIN     1
#define ADC_EXTRA_GPIO  GPIOC
#define ADC_EXTRA1_PIN  2
#define ADC_EXTRA2_PIN  3


// ADC configs

#define gpt3Freq    1000000U
#define ADC1_periods 10
#define ADC3_periods ADC1_periods

#define ADC1Freq (((float) gpt3Freq) /((float) ADC1_periods))
#define ADC3Freq (((float) gpt3Freq) /((float) ADC3_periods))

#endif
