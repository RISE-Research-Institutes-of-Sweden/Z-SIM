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

#include "impedanceModel.h"
#include <math.h>

float GainAdc2Dac = ((float) DACmax)/((float) UDACmax) * ((float) UADCmax)/((float) ADCmax) * 0.5 * 1.0/((float) GainOP) * 1.0/((float) GainCurrentShunt);

int16_t outputDACAmpCalc(float ADCvalue_AC, float dADCvalue_AC_dt, float intADCvalue_AC) {
    float outputDACAmp_res,  outputDACAmp_ind, outputDACAmp_cap, outputDACAmp;

    outputDACAmp_res = GainAdc2Dac * (((float) Rload)/((float) Rshunt) - 1) * ADCvalue_AC;
    outputDACAmp_ind = ((float) ADC1Freq) * GainAdc2Dac * ((float) Lload) / ((float) Rshunt) * dADCvalue_AC_dt; // Muliplication with ADC1Freq for correct time scale
    outputDACAmp_cap = 1/((float) ADC1Freq) * GainAdc2Dac * ( 1/(ADC1Freq*((float) Rshunt) * ((float) Cload)) * intADCvalue_AC); //

    outputDACAmp = outputDACAmp_res + outputDACAmp_ind; // + outputDACAmp_cap;

  return (int16_t) outputDACAmp;
}


