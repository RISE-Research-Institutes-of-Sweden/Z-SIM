/*
    Copyright 2020   Anders Thorsén thorsenanders@yahoo.com


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

#include "dac.h"
#include <math.h>

int32_t dacOut1value;
int32_t dacOut2value;

void toggler(GPTDriver *arg) {
  (void) arg;

  dacPutChannelX(&DACD1, 0, dacOut1value);
  dacPutChannelX(&DACD2, 0, dacOut2value);
  palTogglePad(DAC_GPIO, DAC1_PIN);
  palTogglePad(DAC_GPIO, DAC2_PIN);

}

GPTConfig gpt_config = {
  192000,  //96000,
  toggler,
  TIM_CR2_MMS_1, // What ???
  0
};

static const DACConfig dac_config = {
  .init         = 1, //2047U
  .datamode     = DAC_DHRM_12BIT_RIGHT,
//  .init         = 2047U
//  .datamode     = DAC_DHRM_12BIT_RIGHT_DUAL,
  .cr           = 0
};

void dac_init(void) {

  /*
   * Starting DAC1 driver, setting up the output pin as analog as suggested
   * by the Reference Manual.
   */
  palSetPadMode(DAC_GPIO, DAC1_PIN, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(DAC_GPIO, DAC2_PIN, PAL_MODE_INPUT_ANALOG);

  dacStart(&DACD1, &dac_config);
  dacStart(&DACD2, &dac_config);

  gptObjectInit(&GPTD1);

  gptStart(&GPTD1, &gpt_config);

  gptStartContinuous(&GPTD1, 2);

}
