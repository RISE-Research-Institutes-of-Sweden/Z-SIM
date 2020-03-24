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
extern int32_t mean_I_SENSE;
extern int32_t mean_I_SENSE_4T;

#ifdef STM32F4DISC
BaseSequentialStream * chp = (BaseSequentialStream *) &SD2;
#endif //STM32F4DISC

int main(void) {
  halInit();
  chSysInit();

  adc_init();
  dcdc_init();
  led_init();
  dac_init();

  #ifdef zSIM
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
  while (true) {
        chprintf((BaseSequentialStream *)&SDU1, "ADC1 PA1: %d DACsteps.\n\r", mean_I_SENSE_4T );
        chThdSleepMilliseconds(100);
        chprintf((BaseSequentialStream *)&SDU1, "\033[2J\033[1;1H");

  }

#endif //zSIM

#ifdef STM32F4DISC
  /*
   * Activates the serial driver 2 using the driver default configuration.
   * PA2(TX) and PA3(RX) are routed to USART2.
   */

  palSetPadMode(UART_GPIO, TX_PIN, PAL_MODE_ALTERNATE(7));
  palSetPadMode(UART_GPIO, RX_PIN, PAL_MODE_ALTERNATE(7));


  /*
   * Activates the serial driver 2 using the driver default configuration.
   */
  sdStart(&SD2, NULL);


  /*
   *  Main thread activity...
   */
  while (true) {
        chprintf(chp, "ADC1 PA1: %d DACsteps.\n\r", mean_I_SENSE_4T );
        chThdSleepMilliseconds(100);
        chprintf(chp, "\033[2J\033[1;1H");

  }
   #endif //STM32F4

  }
