/**
 * @file       customdefines.h
 * @brief      Defines relating to device configuration and customisation.
 *             For xCORE-200 Audio MC Board
 * @author     Ross Owen, XMOS Limited
 */
#ifndef _CUSTOMDEFINES_H_
#define _CUSTOMDEFINES_H_

/*
 * Device configuration option defines to override default defines found devicedefines.h
 *
 * Build can be customised but changing and adding defines here
 *
 * Note, we check if they are already defined in Makefile
 */

/* Product String */
#if (UPGRADE_IMAGE == 1)
#define PRODUCT_STR        "PIP Upgrade"
#else
#define PRODUCT_STR        "PIP Early Bringup"
#endif

/* Use the 100MHz ref clock (related to MCLK) for ISO feedback calculation*/
#define FB_USE_REF_CLOCK   1

/* Power optimisations switches. Description, relative power improvement */
#define DISABLE_OTP        1         //Switches off OTP in both tiles, small
#define CLOCK_DOWN_TILE_1  1         //Completely removes clock from unsed processor, large
#define CHAN_BUFF_CTRL     1         //Removes/reduces polling in decouple, medium
#define SCALE_SSWITCH      1         //Reduces clock to node switch, medium
#define DAC_LOW_PWR_MODE   1         //LPMODE: DAC & HP-Amp Low Power Mode Setting, medium

/* Tile defines */
#define AUDIO_IO_TILE      0
#define XUD_TILE           0

/* Board is self-powered i.e. not USB bus-powered */
#define SELF_POWERED       0


/* Enable/Disable SPDIF output - Default is S/PDIF on */
#ifndef SPDIF_TX
#define SPDIF_TX	       0
#endif

/* Defines relating to channel count and channel arrangement (Set to 0 for disable) */
//:audio_defs
/* Number of USB streaming channels - Default is 4 in 4 out */
#ifndef NUM_USB_CHAN_IN
#define NUM_USB_CHAN_IN    (0)         /* Device to Host */
#endif
#ifndef NUM_USB_CHAN_OUT
#define NUM_USB_CHAN_OUT   (2)         /* Host to Device */
#endif

/* Number of IS2 chans to DAC..*/
#ifndef I2S_CHANS_DAC
#define I2S_CHANS_DAC      (2)
#endif

/* Number of I2S chans from ADC */
#ifndef I2S_CHANS_ADC
#define I2S_CHANS_ADC      (0)
#endif

/* Master clock defines (in Hz) */
#define MCLK_441           (512*44100)   /* 44.1, 88.2 etc */
#define MCLK_48            (512*48000)   /* 48, 96 etc */

/* Maximum frequency device runs at */
#ifndef MAX_FREQ
#define MAX_FREQ           (192000)
#endif

//:
/***** Defines relating to USB descriptors etc *****/
//:usb_defs
#define VENDOR_ID          (0x20B1) /* XMOS VID */
#define PID_AUDIO_2        (0x0008) /* SKC_SU1 USB Audio Reference Design PID */
#define PID_AUDIO_1        (0x0009) /* SKC_SU1 Audio Reference Design PID */
//:

/* Enable/Disable example HID code */
#ifndef HID_CONTROLS
#define HID_CONTROLS       1
#endif

#endif
