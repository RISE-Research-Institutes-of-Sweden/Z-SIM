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

float GainuOP2dac = 0.5*((float) DACmax)/((float) GainOP* ((float) UDACmax));

int16_t outputDACAmpCalc(float outputOPPeak2Peak) {
  return (int16_t) GainuOP2dac*outputOPPeak2Peak;
}

void dacOutput(float outputOPPeak2Peak) {
  // Fundera på att ändra till 16-bit uint

  uint16_t dacOut1value, dacOut2value;
  uint16_t outputDACAmp;

  outputDACAmp = outputDACAmpCalc(outputOPPeak2Peak);

// Kolla max och min värde
  dacOut1value = DACmax/2-outputDACAmp;
  dacOut2value = DACmax/2+outputDACAmp;

  dacPutChannelX(&DACD1, 0, dacOut1value);
  dacPutChannelX(&DACD2, 0, dacOut2value);
  palTogglePad(DAC_GPIO, DAC1_PIN);
  palTogglePad(DAC_GPIO, DAC2_PIN);

}

void dac1Set(uint16_t dacOut) {
  // Fundera på att ändra till 16-bit uint

  dacPutChannelX(&DACD1, 0, dacOut);
  palTogglePad(DAC_GPIO, DAC1_PIN);

}

void dac2Set(uint16_t dacOut) {
  // Fundera på att ändra till 16-bit uint

  dacPutChannelX(&DACD2, 0, dacOut);
  palTogglePad(DAC_GPIO, DAC2_PIN);

}


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

}
