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

#ifndef _IMPEDANCEMODEL_H_
#define _IMPEDANCEMODEL_H_

#include "ch.h"
#include "hal.h"
#include "hal_pal.h"
#include "config.h"

extern float Rload, Lload, Cload;

extern int16_t outputDACAmpCalc(float ADCvalue_AC, float dADCvalue_AC_dt, float intADCvalue_AC)

#endif
