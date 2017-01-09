/**
 * @file  main.h
 */

#ifndef __MAIN_H
#define __MAIN_H

void Error_Handler(void);

enum button_states {
    BUTT_NONE,
    BUTT_M_DOWN,
    BUTT_S_DOWN,
    BUTT_MS,
    BUTT_STSP_DOWN,
    BUTT_M_UP,
    BUTT_S_UP,
    BUTT_STSP_UP,
};

#define LONG_PRESS 250U       /* Milliseconds */
#define MAX_IDLE_TIME 120U    /* Seconds */
#define EEPROM_ADDRESS 0U
#define ALARM_DURATION 23000U /* Milliseconds */
#define ALARM_PULSE 62U       /* Milliseconds */

#endif /* __MAIN_H */

