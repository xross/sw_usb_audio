cmake_minimum_required(VERSION 3.21)
include($ENV{XMOS_CMAKE_PATH}/xcommon.cmake)
project(app_usb_aud_xk_316_mc)

set(APP_HW_TARGET xk-audio-316-mc.xn)
include(${CMAKE_CURRENT_LIST_DIR}/../deps.cmake)
set(APP_PCA_ENABLE ON)
set(SW_USB_AUDIO_FLAGS ${EXTRA_BUILD_FLAGS} -O3
                                            -report
                                            -lquadflash
                                            -g
                                            -fxscope
                                            -DBOARD_SUPPORT_BOARD=XK_AUDIO_316_MC_AB
                                            -DADAT_TX_USE_SHARED_BUFF=1)

set(APP_COMPILER_FLAGS_2AMi8o8xxxxxx ${SW_USB_AUDIO_FLAGS})

set(APP_COMPILER_FLAGS_2AMi8o8xxxxxx_mix8 ${SW_USB_AUDIO_FLAGS} -DMAX_MIX_COUNT=8)

set(APP_COMPILER_FLAGS_2AMi8o8xxxxxx_tdm8 ${SW_USB_AUDIO_FLAGS} -DXUA_PCM_FORMAT=XUA_PCM_FORMAT_TDM
                                                                -DMAX_FREQ=96000)

set(APP_COMPILER_FLAGS_2ASi8o8xxxxxx_tdm8 ${SW_USB_AUDIO_FLAGS} -DCODEC_MASTER=1
                                                                -DXUA_PCM_FORMAT=XUA_PCM_FORMAT_TDM
                                                                -DMAX_FREQ=96000)

set(APP_COMPILER_FLAGS_2AMi8o8mxxxxx ${SW_USB_AUDIO_FLAGS} -DMIDI=1)

set(APP_COMPILER_FLAGS_2AMi10o10xssxxx ${SW_USB_AUDIO_FLAGS} -DXUA_SPDIF_TX_EN=1
                                                             -DXUA_SPDIF_RX_EN=1)

set(APP_COMPILER_FLAGS_2AMi16o16xxxaax ${SW_USB_AUDIO_FLAGS} -DXUA_ADAT_RX_EN=1
                                                             -DXUA_ADAT_TX_EN=1)

set(APP_COMPILER_FLAGS_2AMi18o18mssaax ${SW_USB_AUDIO_FLAGS} -DMIDI=1
                                                             -DXUA_ADAT_RX_EN=1
                                                             -DXUA_ADAT_TX_EN=1
                                                             -DXUA_SPDIF_TX_EN=1
                                                             -DXUA_SPDIF_RX_EN=1
                                                             -DMAX_FREQ=96000)

set(APP_COMPILER_FLAGS_1SMi2o2xxxxxx ${SW_USB_AUDIO_FLAGS} -DAUDIO_CLASS=1
                                                           -DXUA_SYNCMODE=XUA_SYNCMODE_SYNC)

set(APP_COMPILER_FLAGS_2SMi8o8xxxxxx ${SW_USB_AUDIO_FLAGS} -DXUA_SYNCMODE=XUA_SYNCMODE_SYNC)

set(APP_COMPILER_FLAGS_2SSi8o8xxxxxx ${SW_USB_AUDIO_FLAGS} -DXUA_SYNCMODE=XUA_SYNCMODE_SYNC
                                                           -DCODEC_MASTER=1)

include(${CMAKE_CURRENT_LIST_DIR}/configs_partial.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/configs_build.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/configs_test.cmake)

set(APP_INCLUDES src src/core src/extensions)
set(XMOS_SANDBOX_DIR ${CMAKE_CURRENT_LIST_DIR}/../..)

XMOS_REGISTER_APP()
