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

// Harware Configuration
#define Rshunt 10.0e-3 //Ohm
#define UADCmax 3.3 //Volt
#define GainCurrentShunt 20 //V/V
#define ADCmax 4095
#define DACmax 4095
#define UDACmax 3.3 //Volt
#define GainOP 2

// HW Pin Configuration

// DACs
#define DAC_GPIO         GPIOA
#define DAC1_PIN        4
#define DAC2_PIN        5

// ADCs

#define ADC_SHUNT_GPIO  GPIOA
#define I_SENSE_PIN     0
#define I_SENSE_4T_PIN  1
#define ADC_DCDC_GPIO   GPIOA
#define RAIL_DIV_PIN    2
#define PWR_DIV_PIN     3
#define ADC_TEMP_GPIO   GPIOC
#define TEMP1_PIN    0
#define TEMP2_PIN     1
#define ADC_EXTRA_GPIO  GPIOC
#define ADC_EXTRA1_PIN  2
#define ADC_EXTRA2_PIN  3

//Load
#define Rload 1.1e-3 //Ohm

#endif
