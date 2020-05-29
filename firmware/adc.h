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

extern float mean_ADC_I_SENSE_AC;
extern float mean_ADC_I_SENSE_4T_AC;
extern float prevmean_ADC_I_SENSE_AC;
extern float prevmean_ADC_I_SENSE_4T_AC;
extern float intmean_ADC_I_SENSE_AC;
extern float intmean_ADC_I_SENSE_4T_AC;
extern float dmean_ADC_I_SENSE_AC_dt;
extern float dmean_ADC_I_SENSE_4T_AC_dt;

// For debugging
extern float mean_ADC_I_SENSE;
extern float mean_ADC_I_SENSE_4T;
// End for debugging


extern float Rload, Lload, Cload;
extern uint16_t loadConfig;

#define RESISTIVE   0
#define INDUCTIVE   1
#define CAPACITIVE  2

extern void adc_init(void);
extern void adc1_start(void);
extern void dacOutput(float outputPeak2Peak);

#endif
