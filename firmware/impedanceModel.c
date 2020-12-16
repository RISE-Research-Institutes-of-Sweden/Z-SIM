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

float GainuAdc2Dac = ((float) DACmax)/((float) UDACmax) * ((float) UADCmax)/((float) ADCmax) * 0.5 * 1.0/((float) GainOP) * 1.0/((float) GainCurrentShunt);

int16_t outputDACAmpCalc(float ADCvalue_AC, float dADCvalue_AC_dt, float intADCvalue_AC) {
    float outputDACAmp_res,  outputDACAmp_ind, outputDACAmp_cap, outputDACAmp;

    outputDACAmp_res = GainuAdc2Dac * (((float) Rload)/((float) Rshunt) - 1) * ADCvalue_AC);
    outputDACAmp_ind = GainuAdc2Dac * ((float) ADC1Freq) * ((float) Lload) / ((float) Rshunt) * ((float) dADCvalue_AC_dt);
    outputDACAmp_cap = GainuAdc2Dac * ( 1/(ADC1Freq*Rshunt*Cload) * intADCvalue_AC);



  return (int16_t) GainuOP2dac*outputOPPeak2Peak;
}


