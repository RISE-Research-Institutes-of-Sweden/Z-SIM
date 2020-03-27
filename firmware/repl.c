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

#include <ctype.h>

#include "ch.h"
#include "hal.h"
#include "chprintf.h"

#include "adc.h"
#include "dac.h"
#include "led.h"
#include "dcdc.h"

#include "heap.h"
#include "symrepr.h"
#include "extensions.h"
#include "eval_cps.h"
#include "print.h"
#include "tokpar.h"
#include "prelude.h"

#define LISPBM_STACK_SIZE  256

#define INPUT_STRING_SIZE  1024
#define OUTPUT_STRING_SIZE 1024
#define ERROR_STRING_SIZE  256

#define REPL_WA_SIZE THD_WORKING_AREA_SIZE(10*2048)

VALUE ext_set_led(VALUE *args, int argn) {
  if (argn != 2) {
    return enc_sym(symrepr_nil());
  }

  int led_num = dec_i(args[1]);
  int state   = dec_i(args[0]);

  led_write(led_num, state);

  return enc_sym(symrepr_true());
}

VALUE ext_dcdc_enable(VALUE *args, int argn) {
  // ignores all arguments
  (void) args;
  (void) argn;

  bool res = dcdc_enable();

  if (res) return enc_sym(symrepr_true());
  return enc_sym(symrepr_nil());
}

VALUE ext_dcdc_disable(VALUE *args, int argn) {
  // ignores all arguments
  (void) args;
  (void) argn;

  dcdc_disable();

  return enc_sym(symrepr_true());
}

VALUE ext_vsel_set(VALUE *args, int argn) {
  if (argn != 1) {
    return enc_sym(symrepr_nil());
  }

  int vsel = dec_i(args[0]);

  if (vsel < 0) return enc_sym(symrepr_nil());

  bool res = dcdc_vsel_set((unsigned int) vsel);

  if (res) return enc_sym(symrepr_true());
  return enc_sym(symrepr_nil());
}


unsigned char inbyte(BaseSequentialStream *chp) {
  unsigned char c;
  while (streamRead(chp, &c, 1) == 0);
  return c;
}

void outbyte(BaseSequentialStream *chp, char c) {
  streamPut(chp, c);
}

int inputline(BaseSequentialStream *chp, char *buffer, int size) {
  int n = 0;
  unsigned char c;
  for (n = 0; n < size - 1; n++) {

    c = inbyte(chp);
    switch (c) {
    case 127: /* fall through to below */
    case '\b': /* backspace character received */
      if (n > 0)
        n--;
      buffer[n] = 0;
      outbyte(chp,'\b'); /* output backspace character */
      n--; /* set up next iteration to deal with preceding char location */
      break;
    case '\n': /* fall through to \r */
    case '\r':
      buffer[n] = 0;
      return n;
    default:
      if (isprint(c)) { /* ignore non-printable characters */
        outbyte(chp,c);
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

static THD_FUNCTION(repl, arg) {

  BaseSequentialStream *chp = (BaseSequentialStream *)arg;

  size_t len = INPUT_STRING_SIZE;
  char *str = malloc(INPUT_STRING_SIZE);
  char *err_str = malloc(ERROR_STRING_SIZE);
  char *outbuf = malloc(OUTPUT_STRING_SIZE);
  int res = 0;

  heap_state_t heap_state;

  res = symrepr_init();
  if (res)
    chprintf(chp,"Symrepr initialized.\n\r");
  else {
    chprintf(chp,"Error initializing symrepr!\n\r");
    return;
  }
  int heap_size = 2048;
  res = heap_init(heap_size);
  if (res)
    chprintf(chp,"Heap initialized. Free cons cells: %u\n\r", heap_num_free());
  else {
    chprintf(chp,"Error initializing heap!\n\r");
    return;
  }

  res = eval_cps_init(LISPBM_STACK_SIZE, true);
  if (res)
    chprintf(chp,"Evaluator initialized.\n\r");
  else {
    chprintf(chp,"Error initializing evaluator.\n\r");
  }


  /* **************************************************
   * EXAMPLE EXTENSION!
   * ************************************************** */
  if (extensions_add("set-led",  ext_set_led)) {
    chprintf(chp,"set-led extension added.\n\r");
  } else {
    chprintf(chp,"set-led extension failed!\n\r");
  }

  if (extensions_add("dcdc-enable",  ext_dcdc_enable)) {
    chprintf(chp,"dcdc-enable extension added.\n\r");
  } else {
    chprintf(chp,"dcdc-enable extension failed!\n\r");
  }

  if (extensions_add("dcdc-disable",  ext_dcdc_disable)) {
    chprintf(chp,"dcdc-disable extension added.\n\r");
  } else {
    chprintf(chp,"dcdc-disable extension failed!\n\r");
  }


  if (extensions_add("vsel-set",  ext_vsel_set)) {
    chprintf(chp,"vsel-set extension added.\n\r");
  } else {
    chprintf(chp,"vsel-set extension failed!\n\r");
  }


  VALUE prelude = prelude_load();
  eval_cps_program(prelude);

  chprintf(chp,"Lisp REPL started (Z-SIM)!\n\r");

  while (1) {
    chThdSleepMilliseconds(100);
    chprintf(chp,"# ");
    memset(str,0,INPUT_STRING_SIZE);
    memset(outbuf,0, OUTPUT_STRING_SIZE);
    inputline(chp,str, len);
    chprintf(chp,"\r\n");

    if (strncmp(str, ":info", 5) == 0) {
      chprintf(chp,"##(Z-SIM)####################################################\r\n");
      chprintf(chp,"Used cons cells: %lu \n\r", heap_size - heap_num_free());
      res = print_value(outbuf, OUTPUT_STRING_SIZE,
			err_str, ERROR_STRING_SIZE,
			eval_cps_get_env());
      if (res > 0) {
	chprintf(chp,"ENV: %s\r\n");
      } else {
	chprintf(chp,"ERROR: %s\r\n");
      }
      heap_get_state(&heap_state);
      chprintf(chp,"GC counter: %lu\r\n", heap_state.gc_num);
      chprintf(chp,"Recovered: %lu\r\n", heap_state.gc_recovered);
      chprintf(chp,"Marked: %lu\r\n", heap_state.gc_marked);
      chprintf(chp,"Free cons cells: %lu\r\n", heap_num_free());
      chprintf(chp,"############################################################\r\n");
      memset(outbuf,0, 1024);
    } else if (strncmp(str, ":quit", 5) == 0) {
      break;
    } else {

      VALUE t;
      t = tokpar_parse(str);

      t = eval_cps_program(t);

      res = print_value(outbuf, OUTPUT_STRING_SIZE,
			err_str, OUTPUT_STRING_SIZE,
			t);
      
      if (res > 0) {
	chprintf(chp,"> %s\r\n", outbuf);
      } else {
	chprintf(chp,"Error: %s\r\n", err_str);
      }
    }
  }

  symrepr_del();
  heap_del();

}


thread_t *createReplThread(BaseSequentialStream *stream) {

  return chThdCreateFromHeap(NULL,
			     REPL_WA_SIZE,
			     "repl",
			     NORMALPRIO + 1,
			     repl,
			     (void *)stream);
}
