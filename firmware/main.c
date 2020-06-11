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
//uint16_t loadConfig;
#define COMMAND_STR_SIZE 256



int inputline(BaseSequentialStream *chp, char *buffer, int size) {
  int n = 0;
  unsigned char c;
  for (n = 0; n < size - 1; n++) {

    c = streamGet(chp);
    switch (c) {
    case 127: /* fall through to below */
    case '\b': /* backspace character received */
      if (n > 0)
        n--;
      buffer[n] = 0;
      streamPut(chp,0x8); /* output backspace character */
      n--; /* set up next iteration to deal with preceding char location */
      break;
    case '\n': /* fall through to \r */
    case '\r':
      buffer[n] = 0;
      return n;
    default:
      if (isprint(c)) { /* ignore non-printable characters */
        streamPut(chp,c);
        buffer[n] = c;
      } else {
        n -= 1;
      }
      break;
    }
  }
  buffer[size - 1] = 0;
  return 0; // Filled up buffer without reading a linebreak
}

int main(void) {

  char command_str[COMMAND_STR_SIZE];
  char buff[64];

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

  //
  /*
   *  Main thread activity...
   */

  float Rload_temp=Rload;
  float Lload_temp=Lload;
  float Cload_temp=Cload;
  unsigned char vsel_temp = 1;
  int n = 0;

  while (true) {

    memset(buff,0,64);
    memset(command_str,0,COMMAND_STR_SIZE);
    bool command_ok = false;

    n = inputline((BaseSequentialStream *)&SDU1, command_str,COMMAND_STR_SIZE);
    chprintf((BaseSequentialStream *)&SDU1,"\r\n", n);

    if (strncmp(command_str,"Help",4)==0) {
      chprintf((BaseSequentialStream *)&SDU1,"Start ADC1: StartADC1\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"Manual read ADC1: ADC1?\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"Start ADC-DAC loop: EnableADC-DAC\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"DCDC enable: EnableDCDC\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"DCDC disable: DisableDCDC\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"vsel /1-15/): Sets resistance stage\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"No value in following responds with stored value\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"Rload /resistance in Ohm/\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"Lload /inductance in Henry/\r\n");
      chprintf((BaseSequentialStream *)&SDU1,"Cload /capacitance in Farad/\r\n");
//      chprintf((BaseSequentialStream *)&SDU1,"Configuration (0=RESISTIVE (R), 1=INDUCTIVE (R+L), 2=CAPACITIVE (R//C))\r\n");
      command_ok = true;
    }

    if (strncmp(command_str,"StartADC1",9)==0) {
      adc1_start();
      chprintf((BaseSequentialStream *)&SDU1,"ADC1 started\r\n");
      command_ok = true;
    }

    if (strncmp(command_str,"EnableADC-DAC",13)==0) {
      EnableADC_DAC = TRUE;
      chprintf((BaseSequentialStream *)&SDU1,"ADC1 started\r\n");
      command_ok = true;
    }

    if (strncmp(command_str,"EnableDCDC",10)==0) {
      dcdc_enable();
      chprintf((BaseSequentialStream *)&SDU1,"DCDC enabled\r\n");
      command_ok = true;
    }

    if (strncmp(command_str,"DisableDCDC",10)==0) {
      dcdc_disable();
      chprintf((BaseSequentialStream *)&SDU1,"DCDC disabled\r\n");
      command_ok = true;
    }

    if (strncmp(command_str,"Rload",5)==0 && strlen(command_str) >= 5) {
      sscanf(command_str,"Rload %f",&Rload_temp);
      Rload = Rload_temp;
      chsnprintf(buff, 64 , "Rload %f", Rload);
      chprintf((BaseSequentialStream *)&SDU1,"%s\r\n", buff);
      command_ok = true;
    }

    if (strncmp(command_str,"Lload",5)==0) {
      sscanf(command_str,"Lload %f",&Lload_temp);
      Lload = Lload_temp;
      command_ok = true;
    }

    if (strncmp(command_str,"Cload",5)==0) {
      sscanf(command_str,"Cload %f",&Cload_temp);
      Cload = Cload_temp;
      command_ok = true;
    }

    if (strncmp(command_str,"vsel",4)==0) {
      sscanf(command_str,"vsel %s",&vsel_temp);
      dcdc_vsel_set(vsel_temp);

      chprintf((BaseSequentialStream *)&SDU1,"Pin 1: %s, %c\r\n", vsel_temp, (vsel_temp & 1));
      chprintf((BaseSequentialStream *)&SDU1,"Pin 2: %s, %c\r\n", vsel_temp, ((vsel_temp >> 1)));
      chprintf((BaseSequentialStream *)&SDU1,"Pin 3: %s, %c\r\n", vsel_temp, ((vsel_temp >> 2) & 1));
      chprintf((BaseSequentialStream *)&SDU1,"Pin 4: %s, %c\r\n", vsel_temp, ((vsel_temp >> 3) & 1));
      chprintf((BaseSequentialStream *)&SDU1,"Pin 5: %s, %c\r\n", vsel_temp, ((vsel_temp >> 4) & 1));

      command_ok = true;
    }

    if (strncmp(command_str,"ADC1?",5)==0) {
      chprintf((BaseSequentialStream *)&SDU1,"ADC1a = %f\r\n", mean_ADC_I_SENSE);
      chprintf((BaseSequentialStream *)&SDU1,"ADC1a_delta = %f\r\n", mean_ADC_I_SENSE_AC);
      chprintf((BaseSequentialStream *)&SDU1,"ADC1b = %f\r\n", mean_ADC_I_SENSE_4T);
      chprintf((BaseSequentialStream *)&SDU1,"ADC1b_delta = %f\r\n", mean_ADC_I_SENSE_4T_AC);
      command_ok = true;
    }

    if (command_ok) {
      chprintf((BaseSequentialStream *)&SDU1,"Ok\r\n");
    } else {
       chprintf((BaseSequentialStream *)&SDU1,"Incorrect Command\r\n");
    }

    chThdSleepMilliseconds(100);
  }
}
