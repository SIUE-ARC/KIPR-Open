Project:      output/KIPR_2
Build Number: 0
Date:         Fri May 20 22:02:04 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   03E2 =    994. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _debug_mask
       01A1  _TERM
       01A2  _tick_time
       01A6  _encoder_res
       034D  LoadConfigTBL_kipr_2_Bank0
       03FC  LoadConfigTBL_kipr_2_Bank1
       0481  __ctype
       0582  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0582   0022 =     34. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0582  __func_lit_start
       05A4  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   05A4   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       05A4  LoadConfigTBL_kipr_2_Ordered
       06A9  _LoadConfigInit
       06A9  LoadConfigInit
       06B0  _LoadConfig_kipr_2
       06B0  LoadConfig_kipr_2
       070B  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   070B   04F2 =   1266. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       070B  _VelTimer_ISR
       070C  _VelTimer_EnableInt
       070C  VelTimer_EnableInt
       0710  _VelTimer_DisableInt
       0710  VelTimer_DisableInt
       0714  _VelTimer_Start
       0714  VelTimer_Start
       0718  VelTimer_Stop
       0718  _VelTimer_Stop
       071C  _VelTimer_WritePeriod
       071C  VelTimer_WritePeriod
       0732  _VelTimer_WriteCompareValue
       0732  VelTimer_WriteCompareValue
       0748  VelTimer_ReadCompareValue
       0748  _VelTimer_ReadCompareValue
       0761  VelTimer_ReadTimerSaveCV
       0761  _VelTimer_ReadCounter
       0761  VelTimer_ReadCounter
       0761  _VelTimer_ReadTimerSaveCV
       07AA  VelTimer_CaptureCounter
       07AA  _VelTimer_CaptureCounter
       07AA  _VelTimer_ReadTimer
       07AA  VelTimer_ReadTimer
       07C5  _UART_TX_ISR
       07C6  _UART_RX_ISR
       083A  UART_EnableInt
       083A  _UART_EnableInt
       0841  _UART_DisableInt
       0841  UART_DisableInt
       0848  _UART_SetTxIntMode
       0848  UART_SetTxIntMode
       085A  UART_Start
       085A  _UART_Start
       0863  UART_Stop
       0863  _UART_Stop
       086A  UART_SendData
       086A  _UART_SendData
       086D  bUART_ReadTxStatus
       086D  _UART_bReadTxStatus
       086D  UART_bReadTxStatus
       086D  _bUART_ReadTxStatus
       0870  bUART_ReadRxData
       0870  _bUART_ReadRxData
       0870  UART_bReadRxData
       0870  _UART_bReadRxData
       0873  _UART_bReadRxStatus
       0873  bUART_ReadRxStatus
       0873  _bUART_ReadRxStatus
       0873  UART_bReadRxStatus
       0876  UART_TxIntMode
       0876  _UART_TxIntMode
       0889  UART_IntCntl
       0889  _UART_IntCntl
       08B4  UART_PutSHexByte
       08B4  _UART_PutSHexByte
       08C7  _UART_PutSHexInt
       08C7  UART_PutSHexInt
       08CE  _UART_PutChar
       08CE  UART_PutChar
       08D6  _UART_cGetChar
       08D6  UART_cGetChar
       08DE  _UART_cReadChar
       08DE  UART_cReadChar
       08F5  UART_iReadChar
       08F5  _UART_iReadChar
       090B  _UART_PutString
       090B  UART_PutString
       091D  _UART_Write
       091D  UART_Write
       0945  UART_CWrite
       0945  _UART_CWrite
       0971  UART_CPutString
       0971  _UART_CPutString
       0983  _UART_PutCRLF
       0983  UART_PutCRLF
       098C  UART_CmdReset
       098C  _UART_CmdReset
       09A2  UART_bCmdCheck
       09A2  _UART_bCmdCheck
       09AA  _UART_bErrCheck
       09AA  UART_bErrCheck
       09B5  UART_bCmdLength
       09B5  _UART_bCmdLength
       09BB  _UART_szGetParam
       09BB  UART_szGetParam
       0A19  _UART_szGetRestOfParams
       0A19  UART_szGetRestOfParams
       0A24  _Servo1_ISR
       0A25  Servo1_EnableInt
       0A25  _Servo1_EnableInt
       0A29  Servo1_DisableInt
       0A29  _Servo1_DisableInt
       0A2D  Servo1_Start
       0A2D  _Servo1_Start
       0A31  Servo1_Stop
       0A31  _Servo1_Stop
       0A35  Servo1_WritePeriod
       0A35  _Servo1_WritePeriod
       0A3B  Servo1_WritePulseWidth
       0A3B  _Servo1_WritePulseWidth
       0A41  _wServo1_ReadPulseWidth
       0A41  wServo1_ReadPulseWidth
       0A41  _Servo1_wReadPulseWidth
       0A41  Servo1_wReadPulseWidth
       0A47  _wServo1_ReadCounter
       0A47  wServo1_ReadCounter
       0A47  Servo1_wReadCounter
       0A47  _Servo1_wReadCounter
       0A81  _Servo0_ISR
       0A82  Servo0_EnableInt
       0A82  _Servo0_EnableInt
       0A86  Servo0_DisableInt
       0A86  _Servo0_DisableInt
       0A8A  Servo0_Start
       0A8A  _Servo0_Start
       0A8E  _Servo0_Stop
       0A8E  Servo0_Stop
       0A92  Servo0_WritePeriod
       0A92  _Servo0_WritePeriod
       0A98  _Servo0_WritePulseWidth
       0A98  Servo0_WritePulseWidth
       0A9E  _wServo0_ReadPulseWidth
       0A9E  Servo0_wReadPulseWidth
       0A9E  _Servo0_wReadPulseWidth
       0A9E  wServo0_ReadPulseWidth
       0AA4  wServo0_ReadCounter
       0AA4  Servo0_wReadCounter
       0AA4  _wServo0_ReadCounter
       0AA4  _Servo0_wReadCounter
       0ADE  _PWMB_ISR
       0ADF  PWMB_EnableInt
       0ADF  _PWMB_EnableInt
       0AE3  _PWMB_DisableInt
       0AE3  PWMB_DisableInt
       0AE7  _PWMB_Start
       0AE7  PWMB_Start
       0AEB  PWMB_Stop
       0AEB  _PWMB_Stop
       0AEF  PWMB_WritePeriod
       0AEF  _PWMB_WritePeriod
       0AF2  _PWMB_WritePulseWidth
       0AF2  PWMB_WritePulseWidth
       0AF5  _bPWMB_ReadPulseWidth
       0AF5  _PWMB_bReadPulseWidth
       0AF5  PWMB_bReadPulseWidth
       0AF5  bPWMB_ReadPulseWidth
       0AF8  PWMB_bReadCounter
       0AF8  _bPWMB_ReadCounter
       0AF8  _PWMB_bReadCounter
       0AF8  bPWMB_ReadCounter
       0B25  _PWMA_ISR
       0B26  PWMA_EnableInt
       0B26  _PWMA_EnableInt
       0B2A  PWMA_DisableInt
       0B2A  _PWMA_DisableInt
       0B2E  PWMA_Start
       0B2E  _PWMA_Start
       0B32  PWMA_Stop
       0B32  _PWMA_Stop
       0B36  PWMA_WritePeriod
       0B36  _PWMA_WritePeriod
       0B39  _PWMA_WritePulseWidth
       0B39  PWMA_WritePulseWidth
       0B3C  PWMA_bReadPulseWidth
       0B3C  _bPWMA_ReadPulseWidth
       0B3C  _PWMA_bReadPulseWidth
       0B3C  bPWMA_ReadPulseWidth
       0B3F  PWMA_bReadCounter
       0B3F  bPWMA_ReadCounter
       0B3F  _PWMA_bReadCounter
       0B3F  _bPWMA_ReadCounter
       0B6C  ENC1B_PEDGE_EnableInt
       0B6C  _ENC1B_PEDGE_EnableInt
       0B70  ENC1B_PEDGE_DisableInt
       0B70  _ENC1B_PEDGE_DisableInt
       0B74  ENC1B_PEDGE_Start
       0B74  _ENC1B_PEDGE_Start
       0B78  _ENC1B_PEDGE_Stop
       0B78  ENC1B_PEDGE_Stop
       0B7C  _ENC1B_NEDGE_ISR
       0B7D  _ENC1B_NEDGE_EnableInt
       0B7D  ENC1B_NEDGE_EnableInt
       0B81  ENC1B_NEDGE_DisableInt
       0B81  _ENC1B_NEDGE_DisableInt
       0B85  ENC1B_NEDGE_Start
       0B85  _ENC1B_NEDGE_Start
       0BB1  ENC1B_NEDGE_Stop
       0BB1  _ENC1B_NEDGE_Stop
       0BB5  ENC1A_PEDGE_EnableInt
       0BB5  _ENC1A_PEDGE_EnableInt
       0BB9  ENC1A_PEDGE_DisableInt
       0BB9  _ENC1A_PEDGE_DisableInt
       0BBD  ENC1A_PEDGE_Start
       0BBD  _ENC1A_PEDGE_Start
       0BC1  _ENC1A_PEDGE_Stop
       0BC1  ENC1A_PEDGE_Stop
       0BC5  ENC1A_NEDGE_EnableInt
       0BC5  _ENC1A_NEDGE_EnableInt
       0BC9  _ENC1A_NEDGE_DisableInt
       0BC9  ENC1A_NEDGE_DisableInt
       0BCD  _ENC1A_NEDGE_Start
       0BCD  ENC1A_NEDGE_Start
       0BF9  ENC1A_NEDGE_Stop
       0BF9  _ENC1A_NEDGE_Stop
       0BFD  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0BFD   1267 =   4711. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0BFD  __text_start
       0BFD  _main
       0CDA  _init
       0DAB  _getVelocity
       108F  _action
       1527  _encoder1_ISR
       157B  _encoder2_ISR
       1AD1  _atoi
       1C12  _itoa
       1DEB  _isdigit
       1E0C  _isspace
       1E2D  _abs
       1E64  __text_end
       1E64  __xidata_start
       1E6E  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0146 =    326. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0143  _bGetPowerSetting
       0143  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  UART_fStatus
       0000  _UART_fStatus
       0001  UART_bRxCnt
       0001  _UART_bRxCnt
       0002  _NO_SHADOW
       0002  NO_SHADOW

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  _UART_aRxBuffer
       0002  UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0012   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0012  __rZ
       0013  __rY
       0014  __rX
       0015  __r11
       0016  __r10
       0017  __r9
       0018  __r8
       0019  __r7
       001A  __r6
       001B  __r5
       001C  __r4
       001D  __r3
       001E  __r2
       001F  __r1
       0020  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0021  _count1
       0025  _count2
       0029  _i
       002B  _command_flag
       002C  _curPrt1
       002E  _prevPrt2
       002F  _curPrt2
       0030  _prevPrt1
       0031  _debug

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ veltimerint.asm, veltimer.asm, uartint.asm, uart.asm, servo1int.asm, servo1.asm, servo0int.asm ]
[ servo0.asm, pwmbint.asm, pwmb.asm, pwmaint.asm, pwma.asm, psocconfigtbl.asm, psocconfig.asm, enc1b_pedge.asm ]
[ enc1b_nedgeint.asm, enc1b_nedge.asm, enc1a_pedge.asm, enc1a_nedge.asm, rZ.asm, rY.asm, rX.asm ]
[ r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmodu_16x16_16_util.asm ]
[ fp2long_util.asm, fp_analysiseject_util.asm, fp_clrreg_util.asm, fp_nan_res_util.asm, fp_saveres_util.asm ]
[ fp_sendtoreg_util.asm, fp_sinf_res_util.asm, fp_szero_res_util.asm, fp_type_oprnd_util.asm ]
[ fp_unnormal_util.asm, fpadd_util.asm, fpdiv_util.asm, fpmul_util.asm, i_div16_block_util.asm ]
[ i_div32_not_util.asm, i_mulu8_block_util.asm, long2fp_util.asm, atoi.s, itoa.s, isdigit.s, isspace.s ]
[ ctype.s, abs.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x12
-Bkipr_2_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

