Project:      output/KIPR_2
Build Number: 0
Date:         Mon May 30 17:24:12 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   03FA =   1018. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _debug_mask
       01A1  _TERM
       01A2  _tick_time
       01A6  _encoder_res
       034D  LoadConfigTBL_kipr_2_Bank0
       0414  LoadConfigTBL_kipr_2_Bank1
       0499  __ctype
       059A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   059A   0022 =     34. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       059A  __func_lit_start
       05BC  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   05BC   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       05BC  LoadConfigTBL_kipr_2_Ordered
       06C1  _LoadConfigInit
       06C1  LoadConfigInit
       06C8  _LoadConfig_kipr_2
       06C8  LoadConfig_kipr_2
       0723  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0723   0508 =   1288. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0723  _VelTimer_ISR
       0724  _VelTimer_EnableInt
       0724  VelTimer_EnableInt
       0728  VelTimer_DisableInt
       0728  _VelTimer_DisableInt
       072C  VelTimer_Start
       072C  _VelTimer_Start
       0730  _VelTimer_Stop
       0730  VelTimer_Stop
       0734  VelTimer_WritePeriod
       0734  _VelTimer_WritePeriod
       0746  _VelTimer_WriteCompareValue
       0746  VelTimer_WriteCompareValue
       0758  VelTimer_ReadCompareValue
       0758  _VelTimer_ReadCompareValue
       0770  VelTimer_ReadTimerSaveCV
       0770  VelTimer_ReadCounter
       0770  _VelTimer_ReadCounter
       0770  _VelTimer_ReadTimerSaveCV
       07B2  VelTimer_CaptureCounter
       07B2  VelTimer_ReadTimer
       07B2  _VelTimer_CaptureCounter
       07B2  _VelTimer_ReadTimer
       07CC  _UART_TX_ISR
       07CD  _UART_RX_ISR
       0841  UART_EnableInt
       0841  _UART_EnableInt
       0848  _UART_DisableInt
       0848  UART_DisableInt
       084F  UART_SetTxIntMode
       084F  _UART_SetTxIntMode
       0861  UART_Start
       0861  _UART_Start
       086A  _UART_Stop
       086A  UART_Stop
       0871  _UART_SendData
       0871  UART_SendData
       0874  _UART_bReadTxStatus
       0874  bUART_ReadTxStatus
       0874  _bUART_ReadTxStatus
       0874  UART_bReadTxStatus
       0877  UART_bReadRxData
       0877  _bUART_ReadRxData
       0877  bUART_ReadRxData
       0877  _UART_bReadRxData
       087A  UART_bReadRxStatus
       087A  bUART_ReadRxStatus
       087A  _UART_bReadRxStatus
       087A  _bUART_ReadRxStatus
       087D  UART_TxIntMode
       087D  _UART_TxIntMode
       0890  UART_IntCntl
       0890  _UART_IntCntl
       08BB  UART_PutSHexByte
       08BB  _UART_PutSHexByte
       08CE  _UART_PutSHexInt
       08CE  UART_PutSHexInt
       08D5  UART_PutChar
       08D5  _UART_PutChar
       08DD  UART_cGetChar
       08DD  _UART_cGetChar
       08E5  _UART_cReadChar
       08E5  UART_cReadChar
       08FC  UART_iReadChar
       08FC  _UART_iReadChar
       0912  _UART_PutString
       0912  UART_PutString
       0924  _UART_Write
       0924  UART_Write
       094C  _UART_CWrite
       094C  UART_CWrite
       0978  _UART_CPutString
       0978  UART_CPutString
       098A  _UART_PutCRLF
       098A  UART_PutCRLF
       0993  _UART_CmdReset
       0993  UART_CmdReset
       09A9  _UART_bCmdCheck
       09A9  UART_bCmdCheck
       09B1  UART_bErrCheck
       09B1  _UART_bErrCheck
       09BC  UART_bCmdLength
       09BC  _UART_bCmdLength
       09C2  _UART_szGetParam
       09C2  UART_szGetParam
       0A20  _UART_szGetRestOfParams
       0A20  UART_szGetRestOfParams
       0A2B  _Servo1_ISR
       0A2C  Servo1_EnableInt
       0A2C  _Servo1_EnableInt
       0A30  Servo1_DisableInt
       0A30  _Servo1_DisableInt
       0A34  Servo1_Start
       0A34  _Servo1_Start
       0A38  Servo1_Stop
       0A38  _Servo1_Stop
       0A3C  Servo1_WritePeriod
       0A3C  _Servo1_WritePeriod
       0A42  Servo1_WritePulseWidth
       0A42  _Servo1_WritePulseWidth
       0A48  _wServo1_ReadPulseWidth
       0A48  wServo1_ReadPulseWidth
       0A48  _Servo1_wReadPulseWidth
       0A48  Servo1_wReadPulseWidth
       0A4E  _wServo1_ReadCounter
       0A4E  wServo1_ReadCounter
       0A4E  Servo1_wReadCounter
       0A4E  _Servo1_wReadCounter
       0A88  _Servo0_ISR
       0A89  Servo0_EnableInt
       0A89  _Servo0_EnableInt
       0A8D  Servo0_DisableInt
       0A8D  _Servo0_DisableInt
       0A91  Servo0_Start
       0A91  _Servo0_Start
       0A95  _Servo0_Stop
       0A95  Servo0_Stop
       0A99  Servo0_WritePeriod
       0A99  _Servo0_WritePeriod
       0A9F  _Servo0_WritePulseWidth
       0A9F  Servo0_WritePulseWidth
       0AA5  _wServo0_ReadPulseWidth
       0AA5  Servo0_wReadPulseWidth
       0AA5  _Servo0_wReadPulseWidth
       0AA5  wServo0_ReadPulseWidth
       0AAB  wServo0_ReadCounter
       0AAB  Servo0_wReadCounter
       0AAB  _wServo0_ReadCounter
       0AAB  _Servo0_wReadCounter
       0AE5  _PWMB_ISR
       0AE6  PWMB_EnableInt
       0AE6  _PWMB_EnableInt
       0AEA  _PWMB_DisableInt
       0AEA  PWMB_DisableInt
       0AEE  _PWMB_Start
       0AEE  PWMB_Start
       0AF2  PWMB_Stop
       0AF2  _PWMB_Stop
       0AF6  PWMB_WritePeriod
       0AF6  _PWMB_WritePeriod
       0AF9  _PWMB_WritePulseWidth
       0AF9  PWMB_WritePulseWidth
       0AFC  _bPWMB_ReadPulseWidth
       0AFC  _PWMB_bReadPulseWidth
       0AFC  PWMB_bReadPulseWidth
       0AFC  bPWMB_ReadPulseWidth
       0AFF  PWMB_bReadCounter
       0AFF  _bPWMB_ReadCounter
       0AFF  _PWMB_bReadCounter
       0AFF  bPWMB_ReadCounter
       0B2C  _PWMA_ISR
       0B2D  _PWMA_EnableInt
       0B2D  PWMA_EnableInt
       0B31  _PWMA_DisableInt
       0B31  PWMA_DisableInt
       0B35  _PWMA_Start
       0B35  PWMA_Start
       0B39  PWMA_Stop
       0B39  _PWMA_Stop
       0B3D  PWMA_WritePeriod
       0B3D  _PWMA_WritePeriod
       0B40  _PWMA_WritePulseWidth
       0B40  PWMA_WritePulseWidth
       0B43  PWMA_bReadPulseWidth
       0B43  _bPWMA_ReadPulseWidth
       0B43  _PWMA_bReadPulseWidth
       0B43  bPWMA_ReadPulseWidth
       0B46  PWMA_bReadCounter
       0B46  bPWMA_ReadCounter
       0B46  _PWMA_bReadCounter
       0B46  _bPWMA_ReadCounter
       0B73  _ENC1B_PEDGE_EnableInt
       0B73  ENC1B_PEDGE_EnableInt
       0B77  ENC1B_PEDGE_DisableInt
       0B77  _ENC1B_PEDGE_DisableInt
       0B7B  ENC1B_PEDGE_Start
       0B7B  _ENC1B_PEDGE_Start
       0B7F  _ENC1B_PEDGE_Stop
       0B7F  ENC1B_PEDGE_Stop
       0B83  _ENC1B_NEDGE_ISR
       0B84  _ENC1B_NEDGE_EnableInt
       0B84  ENC1B_NEDGE_EnableInt
       0B88  ENC1B_NEDGE_DisableInt
       0B88  _ENC1B_NEDGE_DisableInt
       0B8C  ENC1B_NEDGE_Start
       0B8C  _ENC1B_NEDGE_Start
       0BB8  _ENC1B_NEDGE_Stop
       0BB8  ENC1B_NEDGE_Stop
       0BBC  ENC1A_PEDGE_EnableInt
       0BBC  _ENC1A_PEDGE_EnableInt
       0BC0  ENC1A_PEDGE_DisableInt
       0BC0  _ENC1A_PEDGE_DisableInt
       0BC4  ENC1A_PEDGE_Start
       0BC4  _ENC1A_PEDGE_Start
       0BC8  _ENC1A_PEDGE_Stop
       0BC8  ENC1A_PEDGE_Stop
       0BCC  _ENC1A_NEDGE_EnableInt
       0BCC  ENC1A_NEDGE_EnableInt
       0BD0  _ENC1A_NEDGE_DisableInt
       0BD0  ENC1A_NEDGE_DisableInt
       0BD4  ENC1A_NEDGE_Start
       0BD4  _ENC1A_NEDGE_Start
       0C00  _ENC1A_NEDGE_Stop
       0C00  ENC1A_NEDGE_Stop
       0C04  _DelSig_1_ADConversion_ISR
       0C2B  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0C2B   1267 =   4711. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0C2B  __text_start
       0C2B  _main
       0D08  _init
       0DD9  _getVelocity
       10BD  _action
       1555  _encoder1_ISR
       15A9  _encoder2_ISR
       1AFF  _atoi
       1C40  _itoa
       1E19  _isdigit
       1E3A  _isspace
       1E5B  _abs
       1E92  __text_end
       1E92  __xidata_start
       1E9C  __xidata_end

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
                    InterruptRAM   0000   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _UART_fStatus
       0000  UART_fStatus
       0001  _UART_bRxCnt
       0001  UART_bRxCnt
       0002  NO_SHADOW
       0002  _NO_SHADOW
       0002  _DelSig_1_iResult
       0002  DelSig_1_iResult
       0004  DelSig_1_bfStatus
       0004  _DelSig_1_bfStatus

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0005  _UART_aRxBuffer
       0005  UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0015   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0015  __rZ
       0016  __rY
       0017  __rX
       0018  __r11
       0019  __r10
       001A  __r9
       001B  __r8
       001C  __r7
       001D  __r6
       001E  __r5
       001F  __r4
       0020  __r3
       0021  __r2
       0022  __r1
       0023  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0024  _count1
       0028  _count2
       002C  _i
       002E  _command_flag
       002F  _curPrt1
       0031  _prevPrt2
       0032  _curPrt2
       0033  _prevPrt1
       0034  _debug

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ veltimerint.asm, veltimer.asm, uartint.asm, uart.asm, servo1int.asm, servo1.asm, servo0int.asm ]
[ servo0.asm, pwmbint.asm, pwmb.asm, pwmaint.asm, pwma.asm, psocconfigtbl.asm, psocconfig.asm, enc1b_pedge.asm ]
[ enc1b_nedgeint.asm, enc1b_nedge.asm, enc1a_pedge.asm, enc1a_nedge.asm, delsig_1int.asm, rZ.asm ]
[ rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm ]
[ r0.asm, divmodu_16x16_16_util.asm, fp2long_util.asm, fp_analysiseject_util.asm, fp_clrreg_util.asm ]
[ fp_nan_res_util.asm, fp_saveres_util.asm, fp_sendtoreg_util.asm, fp_sinf_res_util.asm, fp_szero_res_util.asm ]
[ fp_type_oprnd_util.asm, fp_unnormal_util.asm, fpadd_util.asm, fpdiv_util.asm, fpmul_util.asm ]
[ i_div16_block_util.asm, i_div32_not_util.asm, i_mulu8_block_util.asm, long2fp_util.asm ]
[ atoi.s, itoa.s, isdigit.s, isspace.s, ctype.s, abs.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x15
-Bkipr_2_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

