
#include "xua.h"
#include <print.h>

void UserBufferManagementInit()
{
}

void UserBufferManagement(unsigned sampsFromUsbToAudio[], unsigned sampsFromAudioToUsb[])
{
    if(XUA_USB_EN == 0)
    {
        if(XUA_SPDIF_RX_EN)
        {
#pragma loop unroll
            for(int i = 0; i < 2; i++)
            {
                sampsFromUsbToAudio[i] = sampsFromAudioToUsb[SPDIF_RX_INDEX+i];
            }
        }
        else if(XUA_ADAT_RX_EN)
        {
#pragma loop unroll
            for(int i = 0; i < 8; i++)
            {
                sampsFromUsbToAudio[i] = sampsFromAudioToUsb[ADAT_RX_INDEX+i];
            }
        }
    }
}
