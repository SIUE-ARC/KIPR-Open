Project:      output/KIPR_2
Build Number: 0
Date:         Tue May 17 14:41:12 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   03AA =    938. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _debug_mask
       01A1  _TERM
       0345  LoadConfigTBL_kipr_2_Bank0
       03DC  LoadConfigTBL_kipr_2_Bank1
       0449  __ctype
       054A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   054A   0022 =     34. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       054A  __func_lit_start
       056C  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   056C   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       056C  LoadConfigTBL_kipr_2_Ordered
       0671  _LoadConfigInit
       0671  LoadConfigInit
       0678  _LoadConfig_kipr_2
       0678  LoadConfig_kipr_2
       06D3  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   06D3   0438 =   1080. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       06D3  _UART_TX_ISR
       06D4  _UART_RX_ISR
       0748  _UART_EnableInt
       0748  UART_EnableInt
       074F  UART_DisableInt
       074F  _UART_DisableInt
       0756  _UART_SetTxIntMode
       0756  UART_SetTxIntMode
       0768  UART_Start
       0768  _UART_Start
       0771  UART_Stop
       0771  _UART_Stop
       0778  _UART_SendData
       0778  UART_SendData
       077B  _bUART_ReadTxStatus
       077B  UART_bReadTxStatus
       077B  bUART_ReadTxStatus
       077B  _UART_bReadTxStatus
       077E  UART_bReadRxData
       077E  bUART_ReadRxData
       077E  _bUART_ReadRxData
       077E  _UART_bReadRxData
       0781  _bUART_ReadRxStatus
       0781  UART_bReadRxStatus
       0781  bUART_ReadRxStatus
       0781  _UART_bReadRxStatus
       0784  UART_TxIntMode
       0784  _UART_TxIntMode
       0797  _UART_IntCntl
       0797  UART_IntCntl
       07C2  _UART_PutSHexByte
       07C2  UART_PutSHexByte
       07D5  UART_PutSHexInt
       07D5  _UART_PutSHexInt
       07DC  UART_PutChar
       07DC  _UART_PutChar
       07E4  _UART_cGetChar
       07E4  UART_cGetChar
       07EC  _UART_cReadChar
       07EC  UART_cReadChar
       0803  UART_iReadChar
       0803  _UART_iReadChar
       0819  _UART_PutString
       0819  UART_PutString
       082B  UART_Write
       082B  _UART_Write
       0853  _UART_CWrite
       0853  UART_CWrite
       087F  _UART_CPutString
       087F  UART_CPutString
       0891  UART_PutCRLF
       0891  _UART_PutCRLF
       089A  _UART_CmdReset
       089A  UART_CmdReset
       08B0  _UART_bCmdCheck
       08B0  UART_bCmdCheck
       08B8  _UART_bErrCheck
       08B8  UART_bErrCheck
       08C3  _UART_bCmdLength
       08C3  UART_bCmdLength
       08C9  _UART_szGetParam
       08C9  UART_szGetParam
       0927  UART_szGetRestOfParams
       0927  _UART_szGetRestOfParams
       0932  _Servo1_ISR
       0933  _Servo1_EnableInt
       0933  Servo1_EnableInt
       0937  _Servo1_DisableInt
       0937  Servo1_DisableInt
       093B  _Servo1_Start
       093B  Servo1_Start
       093F  _Servo1_Stop
       093F  Servo1_Stop
       0943  Servo1_WritePeriod
       0943  _Servo1_WritePeriod
       0949  _Servo1_WritePulseWidth
       0949  Servo1_WritePulseWidth
       094F  Servo1_wReadPulseWidth
       094F  wServo1_ReadPulseWidth
       094F  _wServo1_ReadPulseWidth
       094F  _Servo1_wReadPulseWidth
       0955  wServo1_ReadCounter
       0955  _Servo1_wReadCounter
       0955  _wServo1_ReadCounter
       0955  Servo1_wReadCounter
       098F  _Servo0_ISR
       0990  _Servo0_EnableInt
       0990  Servo0_EnableInt
       0994  Servo0_DisableInt
       0994  _Servo0_DisableInt
       0998  Servo0_Start
       0998  _Servo0_Start
       099C  Servo0_Stop
       099C  _Servo0_Stop
       09A0  Servo0_WritePeriod
       09A0  _Servo0_WritePeriod
       09A6  _Servo0_WritePulseWidth
       09A6  Servo0_WritePulseWidth
       09AC  _Servo0_wReadPulseWidth
       09AC  wServo0_ReadPulseWidth
       09AC  _wServo0_ReadPulseWidth
       09AC  Servo0_wReadPulseWidth
       09B2  _wServo0_ReadCounter
       09B2  wServo0_ReadCounter
       09B2  _Servo0_wReadCounter
       09B2  Servo0_wReadCounter
       09EC  _PWMB_ISR
       09ED  _PWMB_EnableInt
       09ED  PWMB_EnableInt
       09F1  PWMB_DisableInt
       09F1  _PWMB_DisableInt
       09F5  _PWMB_Start
       09F5  PWMB_Start
       09F9  _PWMB_Stop
       09F9  PWMB_Stop
       09FD  _PWMB_WritePeriod
       09FD  PWMB_WritePeriod
       0A00  _PWMB_WritePulseWidth
       0A00  PWMB_WritePulseWidth
       0A03  PWMB_bReadPulseWidth
       0A03  bPWMB_ReadPulseWidth
       0A03  _bPWMB_ReadPulseWidth
       0A03  _PWMB_bReadPulseWidth
       0A06  _bPWMB_ReadCounter
       0A06  _PWMB_bReadCounter
       0A06  PWMB_bReadCounter
       0A06  bPWMB_ReadCounter
       0A33  _PWMA_ISR
       0A34  _PWMA_EnableInt
       0A34  PWMA_EnableInt
       0A38  _PWMA_DisableInt
       0A38  PWMA_DisableInt
       0A3C  _PWMA_Start
       0A3C  PWMA_Start
       0A40  _PWMA_Stop
       0A40  PWMA_Stop
       0A44  PWMA_WritePeriod
       0A44  _PWMA_WritePeriod
       0A47  PWMA_WritePulseWidth
       0A47  _PWMA_WritePulseWidth
       0A4A  _bPWMA_ReadPulseWidth
       0A4A  _PWMA_bReadPulseWidth
       0A4A  PWMA_bReadPulseWidth
       0A4A  bPWMA_ReadPulseWidth
       0A4D  _bPWMA_ReadCounter
       0A4D  bPWMA_ReadCounter
       0A4D  _PWMA_bReadCounter
       0A4D  PWMA_bReadCounter
       0A7A  ENC1B_PEDGE_EnableInt
       0A7A  _ENC1B_PEDGE_EnableInt
       0A7E  ENC1B_PEDGE_DisableInt
       0A7E  _ENC1B_PEDGE_DisableInt
       0A82  ENC1B_PEDGE_Start
       0A82  _ENC1B_PEDGE_Start
       0A86  _ENC1B_PEDGE_Stop
       0A86  ENC1B_PEDGE_Stop
       0A8A  _ENC1B_NEDGE_ISR
       0A8B  ENC1B_NEDGE_EnableInt
       0A8B  _ENC1B_NEDGE_EnableInt
       0A8F  ENC1B_NEDGE_DisableInt
       0A8F  _ENC1B_NEDGE_DisableInt
       0A93  _ENC1B_NEDGE_Start
       0A93  ENC1B_NEDGE_Start
       0ABF  _ENC1B_NEDGE_Stop
       0ABF  ENC1B_NEDGE_Stop
       0AC3  _ENC1A_PEDGE_EnableInt
       0AC3  ENC1A_PEDGE_EnableInt
       0AC7  _ENC1A_PEDGE_DisableInt
       0AC7  ENC1A_PEDGE_DisableInt
       0ACB  _ENC1A_PEDGE_Start
       0ACB  ENC1A_PEDGE_Start
       0ACF  _ENC1A_PEDGE_Stop
       0ACF  ENC1A_PEDGE_Stop
       0AD3  _ENC1A_NEDGE_EnableInt
       0AD3  ENC1A_NEDGE_EnableInt
       0AD7  ENC1A_NEDGE_DisableInt
       0AD7  _ENC1A_NEDGE_DisableInt
       0ADB  ENC1A_NEDGE_Start
       0ADB  _ENC1A_NEDGE_Start
       0B07  ENC1A_NEDGE_Stop
       0B07  _ENC1A_NEDGE_Stop
       0B0B  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0B0B   0A1F =   2591. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0B0B  _main
       0B0B  __text_start
       0BE8  _init
       0CB6  _getVelocity
       0CCF  _action
       10E2  _encoder1_ISR
       1136  _encoder2_ISR
       11CE  _atoi
       130F  _itoa
       14E8  _isdigit
       1509  _isspace
       152A  __text_end
       152A  __xidata_start
       1534  __xidata_end

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
               virtual_registers   0012   0009 =      9. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0012  __rZ
       0013  __rY
       0014  __rX
       0015  __r5
       0016  __r4
       0017  __r3
       0018  __r2
       0019  __r1
       001A  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _count1
       001F  _count2
       0023  _i
       0025  _curPrt1
       0027  _command_flag
       0028  _debug
       0029  _prevPrt2
       002A  _curPrt2
       002B  _prevPrt1

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, servo1int.asm, servo1.asm, servo0int.asm, servo0.asm, pwmbint.asm, pwmb.asm ]
[ pwmaint.asm, pwma.asm, psocconfigtbl.asm, psocconfig.asm, enc1b_pedge.asm, enc1b_nedgeint.asm ]
[ enc1b_nedge.asm, enc1a_pedge.asm, enc1a_nedge.asm, rZ.asm, rY.asm, rX.asm, r5.asm, r4.asm, r3.asm ]
[ r2.asm, r1.asm, r0.asm, divmodu_16x16_16_util.asm, i_div16_block_util.asm, atoi.s, itoa.s, isdigit.s ]
[ isspace.s, ctype.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x12
-Bkipr_2_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

