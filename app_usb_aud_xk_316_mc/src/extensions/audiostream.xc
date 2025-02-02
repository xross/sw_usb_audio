// Copyright 2022-2024 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.
#include <platform.h>

on tile[0]: out port p_leds = XS1_PORT_4F;

void UserAudioStreamStart(void)
{
    /* Turn all LEDs on */
    p_leds <: 0xF;
}

void UserAudioStreamStop(void)
{
    /* Turn all LEDs off */
    p_leds <: 0x0;
}

