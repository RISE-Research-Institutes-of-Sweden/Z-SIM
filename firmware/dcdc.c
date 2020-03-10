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

#include "dcdc.h"


static unsigned char dcdc_vsel;


void dcdc_init(void) {

  dcdc_vsel = 1;

  // Digital outputs
  palSetPadMode(VSEL_GPIO,
		VSEL_1_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_2_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_3_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_4_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palSetPadMode(VSEL_GPIO,
		VSEL_5_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);


  palSetPadMode(DCDC_OUTPUT_ENABLE_GPIO,
		DCDC_OUTPUT_ENABLE_PIN,
		PAL_MODE_OUTPUT_PUSHPULL |
		PAL_STM32_OSPEED_HIGHEST);
  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      0);


  palWritePad(VSEL_GPIO, VSEL_1_PIN, dcdc_vsel & 1);
  palWritePad(VSEL_GPIO, VSEL_2_PIN, (dcdc_vsel >> 1) & 1);
  palWritePad(VSEL_GPIO, VSEL_3_PIN, (dcdc_vsel >> 2) & 1);
  palWritePad(VSEL_GPIO, VSEL_4_PIN, (dcdc_vsel >> 3) & 1);
  palWritePad(VSEL_GPIO, VSEL_5_PIN, (dcdc_vsel >> 4) & 1);

}

bool dcdc_vsel_set(unsigned char vsel) {

  if (!(vsel & 0x1F)) return false;

  dcdc_vsel = vsel;

  palWritePad(VSEL_GPIO, VSEL_1_PIN, dcdc_vsel & 1);
  palWritePad(VSEL_GPIO, VSEL_2_PIN, (dcdc_vsel >> 1) & 1);
  palWritePad(VSEL_GPIO, VSEL_3_PIN, (dcdc_vsel >> 2) & 1);
  palWritePad(VSEL_GPIO, VSEL_4_PIN, (dcdc_vsel >> 3) & 1);
  palWritePad(VSEL_GPIO, VSEL_5_PIN, (dcdc_vsel >> 4) & 1);

  return true;
}


bool dcdc_enable(void) {

  if (!(dcdc_vsel & 0x1F)) return false;

  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      1);

  return true;
}

void dcdc_disable(void) {

  palWritePad(DCDC_OUTPUT_ENABLE_GPIO,
	      DCDC_OUTPUT_ENABLE_PIN,
	      0);

}
