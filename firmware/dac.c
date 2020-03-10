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

int32_t DAC1_calcvalue;
int32_t DAC2_calcvalue;

unsigned short sin_buffer[256];

unsigned int freq = 1000;
unsigned int base_freq = 96000;
float base_freq_period = 1.0/96000.0;


/*
void toggler(GPTDriver *arg) {
  (void) arg;

  static unsigned int cnt = 0;

  float t = ((float)cnt * base_freq_period);
  unsigned char a = (unsigned char)(t * 256 * freq);

  dacPutChannelX(&DACD1, 0, sin_buffer[a]);
  palTogglePad(GPIOA, 4);

  cnt++;
}
*/

void toggler(GPTDriver *arg) {
  (void) arg;

  dacPutChannelX(&DACD1, 0, DAC1_calcvalue);
  dacPutChannelX(&DACD2, 0, DAC2_calcvalue);
  palTogglePad(GPIOA, 4);
  palTogglePad(GPIOA, 5);

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

/*
static const DACConversionGroup dacgrpcfg1 = {
  .num_channels = 2U,

}

*/

void dac_init(void) {

//  for (int i = 0; i < 256; i ++) {
//    sin_buffer[i] = (unsigned short)(2047.5 + (2047.5 * sin(2*3.1459*((float)i/256.0))));
//    sin_buffer[i] = (unsigned short)(2047.5 + (2047.5 * );
//  }

  /*
   * Starting DAC1 driver, setting up the output pin as analog as suggested
   * by the Reference Manual.
   */
  palSetPadMode(GPIOA, 4, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(GPIOA, 5, PAL_MODE_INPUT_ANALOG);
//  palSetPadMode(GPIOA, 4, PAL_MODE_OUTPUT_PUSHPULL );
//  palSetPadMode(GPIOA, 5, PAL_MODE_OUTPUT_PUSHPULL );

  dacStart(&DACD1, &dac_config);
  dacStart(&DACD2, &dac_config);

  gptObjectInit(&GPTD1);

  gptStart(&GPTD1, &gpt_config);

  gptStartContinuous(&GPTD1, 2);

}
