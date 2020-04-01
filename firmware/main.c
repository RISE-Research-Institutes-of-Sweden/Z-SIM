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

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

#include "ch.h"
#include "hal.h"
#include "usbcfg.h"
#include "chprintf.h"

#include "config.h"
#include "adc.h"
#include "dac.h"
#include "dcdc.h"
#include "led.h"
#include "repl.h"


int main(void) {
  halInit();
  chSysInit();

  adc_init();
  dcdc_init();
  led_init();
  dac_init();


  sduObjectInit(&SDU1);
  sduStart(&SDU1, &serusbcfg);

  /*
   * Activates the USB driver and then the USB bus pull-up on D+.
   * Note, a delay is inserted in order to not have to disconnect the cable
   * after a reset.;
   */
  usbDisconnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(1500);
  usbStart(serusbcfg.usbp, &usbcfg);
  usbConnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(500);

  createReplThread((BaseSequentialStream *)&SDU1);
  /*
   *  Main thread activity...
   */
  char buff[64];

  while (true) {
        snprintf(buff, 64 , "ADC_I_SENSE_AC %1.2f", mean_ADC_I_SENSE_AC);
        chprintf((BaseSequentialStream *)&SDU1,"%s, ",buff);
        snprintf(buff, 64 , "ADC_I_SENSE_4T_AC %1.2f", mean_ADC_I_SENSE_4T_AC);
        chprintf((BaseSequentialStream *)&SDU1,"%s, ",buff);
        snprintf(buff, 64 , "prev_ADC_I_SENSE_AC %1.2f", prevmean_ADC_I_SENSE_AC);
        chprintf((BaseSequentialStream *)&SDU1,"%s, ",buff);
        snprintf(buff, 64 , "prev_ADC_I_SENSE_4T_AC %1.2f", prevmean_ADC_I_SENSE_4T_AC);
        chprintf((BaseSequentialStream *)&SDU1,"%s, ",buff);
        snprintf(buff, 64 , "dADC_I_SENSE_4T_AC_dt %1.2f", dmean_ADC_I_SENSE_4T_AC_dt);
        chprintf((BaseSequentialStream *)&SDU1,"%s, ",buff);
        snprintf(buff, 64 , "intADC_I_SENSE_4T_AC %1.2f", intmean_ADC_I_SENSE_4T_AC);
        chprintf((BaseSequentialStream *)&SDU1,"%s \r\n",buff);
        chThdSleepMilliseconds(500);

      }
  }
