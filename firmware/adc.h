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

#include "ch.h"
#include "hal.h"
#include "hal_pal.h"
#include "config.h"

extern bool flag_ADC1;
extern bool flag_ADC2;
extern bool flag_ADC3;
extern int32_t mean_I_SENSE;
extern int32_t mean_I_SENSE_4T;;
extern int32_t lastvalue_ADC2;
extern int32_t lastvalue_ADC3;
extern int32_t prevMean_I_SENSE_AC;
extern int32_t prevMean_I_SENSE_4T_AC;
extern int32_t intMean_I_SENSE_AC;
extern int32_t intMean_I_SENSE_4T_AC;
extern int32_t dMean_I_SENSE_AC_dt;
extern int32_t dMean_I_SENSE_4T_AC_dt;


extern void adc_init(void);
extern float R_voltage(float current, float resistance);
extern float C_voltage(float current, float Ii_t_ack, float capacitance);
extern float L_voltage(float current, float prevCurrent, float inductance, float resistance, float dt);
extern int32_t deltaDAC(int32_t ADCvalue_AC, int32_t dADCvalue_AC_dt, int32_t intADCvalue_AC);
extern void dacOutput(int32_t outputPeak2Peak);

#endif
