#include <xccompat.h>
#include <stdint.h>
#include <stdio.h>
#define DEBUG_PRINT_ENABLE  1
#include "debug_print.h"
#include "xud.h"
#include "usb_std_requests.h"
#include "usb_device.h"
#include "hid.h"
#include "control.h"

void VendorAudioRequestsInit(chanend c_audioControl, CLIENT_INTERFACE(control, i_modules), size_t num_modules)
{
    debug_printf("USB control enabled\n");
}


/* Functions that handle customer vendor requests.
 *
 * THESE NEED IMPLEMENTING FOR A SPECIFIC DESIGN
 *
 * Should return 0 if handled sucessfully, else return 0 (-1 for passing up reset/suspend)
 *
 * */

#define EP0_MAX_PACKET_SIZE     512

int VendorAudioRequests(XUD_ep ep0_out, XUD_ep ep0_in, REFERENCE_PARAM(USB_SetupPacket_t, sp), CLIENT_INTERFACE(control, i_modules), size_t num_modules)
{

    XUD_Result_t result = XUD_RES_ERR;
    unsigned char request_data[EP0_MAX_PACKET_SIZE];
    unsigned request_data_length = 0;
    unsigned direction = sp.bmRequestType.Direction;

    //debug_printf("Vendor request direction=%d\n", direction);
    switch (direction) {
        case USB_BM_REQTYPE_DIRECTION_H2D: //0 = SET
             request_data_length = 0; /* length not required by XUD API coming in */
             result = XUD_GetBuffer(ep0_out, request_data, request_data_length);
             if (result == XUD_RES_OKAY) {
                 /*
               c_ep0_control <: (int)direction;
               master {
                 c_ep0_control <: (int)sp.wIndex;
                 c_ep0_control <: (int)sp.wValue;
                 c_ep0_control <: (int)sp.wLength;
                 for (i = 0; i < request_data_length; i++) {
                     c_ep0_control <: request_data[i];
                 }
               }
              */

               result = XUD_DoSetRequestStatus(ep0_in);
             }
             break;

        case USB_BM_REQTYPE_DIRECTION_D2H: //1 = GET
            request_data_length = sp.wLength;

            /*
            c_ep0_control <: (int)direction;
            master {
                c_ep0_control <: (int)sp.wIndex;
                c_ep0_control <: (int)sp.wValue;
                c_ep0_control <: (int)sp.wLength;
            }
            // application retrieval latency here
            slave {
                for (i = 0; i < request_data_length; i++) {
                    c_ep0_control :> request_data[i];
                }
            }
            */

            result = XUD_DoGetRequest(ep0_out, ep0_in, request_data, request_data_length, request_data_length);
            break;

        default:
            __builtin_unreachable();
        break;
        }
    return result;
}


