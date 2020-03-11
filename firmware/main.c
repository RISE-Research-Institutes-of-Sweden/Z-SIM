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

extern int32_t dacOut1value;
extern int32_t dacOut2value;

int32_t deltaDACvalue;

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
   * after a reset.lastvalue_ADC1
   */
  usbDisconnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(1500);
  usbStart(serusbcfg.usbp, &usbcfg);
  usbConnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(500);

 // createReplThread((BaseSequentialStream *)&SDU1);

  /*
   *  Main thread activity...
   */
  while (true) {


    if (flag_ADC1) {
        chprintf((BaseSequentialStream *)&SDU1, "ADC1 PA1: %d DACsteps.\n\r", lastvalue_ADC1 );
        deltaDACvalue = deltaDAC(lastvalue_ADC1);
        dacOut1value = (DACmax+10*deltaDACvalue)/2;
        dacOut2value = (DACmax-10*deltaDACvalue)/2;
        chprintf((BaseSequentialStream *)&SDU1, "Calculated DAC1 and DAC2: %d and %d \n\r", dacOut1value, dacOut2value);
        flag_ADC1 = FALSE;
        chThdSleepMilliseconds(1);
        chprintf((BaseSequentialStream *)&SDU1, "\033[2J\033[1;1H");
    }
  }
}
