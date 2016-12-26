/**
 * @file  main.h
 */

#ifndef __MAIN_H
#define __MAIN_H

#include "stdint.h"

void Error_Handler(void);
void increase_time(void);
void decrease_time(void);
void idle_timeout(void);

enum main_states {
    STATE_INIT,
    STATE_OFF,
    STATE_SETUP,
    STATE_COUNTDOWN,
    STATE_STOPPED,
    STATE_ALARM,
};

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

enum button_flags {
    BUTTON_M    = 1,
    BUTTON_S    = 2,
    BUTTON_STSP = 4,
};

#define LONG_PRESS 250U
#define MAX_IDLE_TIME 120U

#endif /* __MAIN_H */

