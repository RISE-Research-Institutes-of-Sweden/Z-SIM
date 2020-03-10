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

#ifndef _ADC_H_
#define _ADC_H_

#include "hal.h"
#include "hal_pal.h"

#define Rshunt 10.0e-3 //Ohm
#define UADCmax 3.3 //Volt
#define GainCurrentShunt 20 //V/V
#define ADCmax 4095
#define DACmax 4095
#define UDACmax 3.3 //Volt
#define Rload 1.1e-3 //Ohm
#define GainOP 2

extern bool flag_ADC1;
extern bool flag_ADC2;
extern bool flag_ADC3;
extern int32_t lastvalue_ADC1;
extern int32_t lastvalue_ADC2;
extern int32_t lastvalue_ADC3;

extern void adc_init(void);
extern float R_voltage(float current, float resistance);
extern float C_voltage(float current, float Ii_t_ack, float capacitance);
extern float L_voltage(float current, float prevCurrent, float inductance, float resistance, float dt);
extern int32_t deltaDAC(int32_t ADCvalue);

#endif