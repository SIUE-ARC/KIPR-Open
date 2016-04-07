Project:      output/KIPR_2
Build Number: 0
Date:         Thu Apr 07 17:31:28 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   02E9 =    745. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _MAV
       01A1  _MOV
       01A2  _GETV
       01A3  _SRV0_POS
       01A4  _SRV1_POS
       01A5  _SRV2_POS
       01A6  _SRV3_POS
       01A7  _GETC1
       01A8  _GETC2
       01A9  _RSTC1
       01AA  _RSTC2
       01AB  _STOP
       01AC  _TERM
       029C  LoadConfigTBL_kipr_2_Bank0
       0327  LoadConfigTBL_kipr_2_Bank1
       0388  __ctype
       0489  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0489   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0489  __func_lit_start
       048B  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   048B   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       048B  LoadConfigTBL_kipr_2_Ordered
       0590  _LoadConfigInit
       0590  LoadConfigInit
       0597  _LoadConfig_kipr_2
       0597  LoadConfig_kipr_2
       05F2  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   05F2   03DB =    987. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       05F2  _UART_TX_ISR
       05F3  _UART_RX_ISR
       0667  _UART_EnableInt
       0667  UART_EnableInt
       066E  UART_DisableInt
       066E  _UART_DisableInt
       0675  _UART_SetTxIntMode
       0675  UART_SetTxIntMode
       0687  _UART_Start
       0687  UART_Start
       0690  _UART_Stop
       0690  UART_Stop
       0697  _UART_SendData
       0697  UART_SendData
       069A  _bUART_ReadTxStatus
       069A  UART_bReadTxStatus
       069A  bUART_ReadTxStatus
       069A  _UART_bReadTxStatus
       069D  bUART_ReadRxData
       069D  UART_bReadRxData
       069D  _bUART_ReadRxData
       069D  _UART_bReadRxData
       06A0  bUART_ReadRxStatus
       06A0  _UART_bReadRxStatus
       06A0  _bUART_ReadRxStatus
       06A0  UART_bReadRxStatus
       06A3  _UART_TxIntMode
       06A3  UART_TxIntMode
       06B6  UART_IntCntl
       06B6  _UART_IntCntl
       06E1  UART_PutSHexByte
       06E1  _UART_PutSHexByte
       06F4  _UART_PutSHexInt
       06F4  UART_PutSHexInt
       06FB  _UART_PutChar
       06FB  UART_PutChar
       0703  UART_cGetChar
       0703  _UART_cGetChar
       070B  _UART_cReadChar
       070B  UART_cReadChar
       0722  UART_iReadChar
       0722  _UART_iReadChar
       0738  UART_PutString
       0738  _UART_PutString
       074A  UART_Write
       074A  _UART_Write
       0772  _UART_CWrite
       0772  UART_CWrite
       079E  UART_CPutString
       079E  _UART_CPutString
       07B0  UART_PutCRLF
       07B0  _UART_PutCRLF
       07B9  _UART_CmdReset
       07B9  UART_CmdReset
       07CF  UART_bCmdCheck
       07CF  _UART_bCmdCheck
       07D7  _UART_bErrCheck
       07D7  UART_bErrCheck
       07E2  UART_bCmdLength
       07E2  _UART_bCmdLength
       07E8  _UART_szGetParam
       07E8  UART_szGetParam
       0846  _UART_szGetRestOfParams
       0846  UART_szGetRestOfParams
       0851  _ServoA_ISR
       0852  ServoA_EnableInt
       0852  _ServoA_EnableInt
       0856  ServoA_DisableInt
       0856  _ServoA_DisableInt
       085A  ServoA_Start
       085A  _ServoA_Start
       085E  _ServoA_Stop
       085E  ServoA_Stop
       0862  ServoA_WritePeriod
       0862  _ServoA_WritePeriod
       0868  ServoA_WritePulseWidth
       0868  _ServoA_WritePulseWidth
       086E  wServoA_ReadPulseWidth
       086E  ServoA_wReadPulseWidth
       086E  _ServoA_wReadPulseWidth
       086E  _wServoA_ReadPulseWidth
       0874  wServoA_ReadCounter
       0874  _ServoA_wReadCounter
       0874  _wServoA_ReadCounter
       0874  ServoA_wReadCounter
       08AE  _PWMB_ISR
       08AF  PWMB_EnableInt
       08AF  _PWMB_EnableInt
       08B3  _PWMB_DisableInt
       08B3  PWMB_DisableInt
       08B7  PWMB_Start
       08B7  _PWMB_Start
       08BB  _PWMB_Stop
       08BB  PWMB_Stop
       08BF  _PWMB_WritePeriod
       08BF  PWMB_WritePeriod
       08C2  _PWMB_WritePulseWidth
       08C2  PWMB_WritePulseWidth
       08C5  _bPWMB_ReadPulseWidth
       08C5  _PWMB_bReadPulseWidth
       08C5  PWMB_bReadPulseWidth
       08C5  bPWMB_ReadPulseWidth
       08C8  PWMB_bReadCounter
       08C8  _PWMB_bReadCounter
       08C8  _bPWMB_ReadCounter
       08C8  bPWMB_ReadCounter
       08F5  _PWMA_ISR
       08F6  PWMA_EnableInt
       08F6  _PWMA_EnableInt
       08FA  _PWMA_DisableInt
       08FA  PWMA_DisableInt
       08FE  PWMA_Start
       08FE  _PWMA_Start
       0902  PWMA_Stop
       0902  _PWMA_Stop
       0906  _PWMA_WritePeriod
       0906  PWMA_WritePeriod
       0909  _PWMA_WritePulseWidth
       0909  PWMA_WritePulseWidth
       090C  _PWMA_bReadPulseWidth
       090C  _bPWMA_ReadPulseWidth
       090C  PWMA_bReadPulseWidth
       090C  bPWMA_ReadPulseWidth
       090F  bPWMA_ReadCounter
       090F  _bPWMA_ReadCounter
       090F  _PWMA_bReadCounter
       090F  PWMA_bReadCounter
       093C  _ENC1B_PEDGE_EnableInt
       093C  ENC1B_PEDGE_EnableInt
       0940  _ENC1B_PEDGE_DisableInt
       0940  ENC1B_PEDGE_DisableInt
       0944  ENC1B_PEDGE_Start
       0944  _ENC1B_PEDGE_Start
       0948  ENC1B_PEDGE_Stop
       0948  _ENC1B_PEDGE_Stop
       094C  _ENC1B_FEDGE_ISR
       094D  ENC1B_FEDGE_EnableInt
       094D  _ENC1B_FEDGE_EnableInt
       0951  _ENC1B_FEDGE_DisableInt
       0951  ENC1B_FEDGE_DisableInt
       0955  ENC1B_FEDGE_Start
       0955  _ENC1B_FEDGE_Start
       0981  ENC1B_FEDGE_Stop
       0981  _ENC1B_FEDGE_Stop
       0985  _ENC1A_PEDGE_EnableInt
       0985  ENC1A_PEDGE_EnableInt
       0989  _ENC1A_PEDGE_DisableInt
       0989  ENC1A_PEDGE_DisableInt
       098D  _ENC1A_PEDGE_Start
       098D  ENC1A_PEDGE_Start
       0991  _ENC1A_PEDGE_Stop
       0991  ENC1A_PEDGE_Stop
       0995  ENC1A_FEDGE_EnableInt
       0995  _ENC1A_FEDGE_EnableInt
       0999  ENC1A_FEDGE_DisableInt
       0999  _ENC1A_FEDGE_DisableInt
       099D  _ENC1A_FEDGE_Start
       099D  ENC1A_FEDGE_Start
       09C9  ENC1A_FEDGE_Stop
       09C9  _ENC1A_FEDGE_Stop
       09CD  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   09CD   0789 =   1929. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       09CD  _main
       09CD  __text_start
       0A50  _getVelocity
       0A5A  _parseCommand
       0D0E  _encoder1_ISR
       0D62  _encoder2_ISR
       0DFA  _atoi
       0F3B  _itoa
       1114  _isdigit
       1135  _isspace
       1156  __text_end
       1156  __xidata_start
       1162  __xidata_end

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
                            data   0000   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _count2
       001F  _count1
       0023  _i
       0025  _curPrt1
       0027  _prevPrt2
       0028  _curPrt2
       0029  _prevPrt1

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, servoaint.asm, servoa.asm, pwmbint.asm, pwmb.asm, pwmaint.asm, pwma.asm ]
[ psocconfigtbl.asm, psocconfig.asm, enc1b_pedge.asm, enc1b_fedgeint.asm, enc1b_fedge.asm, enc1a_pedge.asm ]
[ enc1a_fedge.asm, rZ.asm, rY.asm, rX.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmodu_16x16_16_util.asm ]
[ i_div16_block_util.asm, atoi.s, itoa.s, isdigit.s, isspace.s, ctype.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x12
-Bkipr_2_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

