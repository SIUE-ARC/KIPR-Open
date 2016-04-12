Project:      output/KIPR_2
Build Number: 0
Date:         Tue Apr 12 16:54:59 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0303 =    771. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _TEMRM
       02B6  LoadConfigTBL_kipr_2_Bank0
       0341  LoadConfigTBL_kipr_2_Bank1
       03A2  __ctype
       04A3  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   04A3   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       04A3  __func_lit_start
       04A5  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   04A5   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       04A5  LoadConfigTBL_kipr_2_Ordered
       05AA  _LoadConfigInit
       05AA  LoadConfigInit
       05B1  _LoadConfig_kipr_2
       05B1  LoadConfig_kipr_2
       060C  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   060C   03DB =    987. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       060C  _UART_TX_ISR
       060D  _UART_RX_ISR
       0681  _UART_EnableInt
       0681  UART_EnableInt
       0688  UART_DisableInt
       0688  _UART_DisableInt
       068F  _UART_SetTxIntMode
       068F  UART_SetTxIntMode
       06A1  _UART_Start
       06A1  UART_Start
       06AA  _UART_Stop
       06AA  UART_Stop
       06B1  _UART_SendData
       06B1  UART_SendData
       06B4  _bUART_ReadTxStatus
       06B4  UART_bReadTxStatus
       06B4  bUART_ReadTxStatus
       06B4  _UART_bReadTxStatus
       06B7  bUART_ReadRxData
       06B7  UART_bReadRxData
       06B7  _bUART_ReadRxData
       06B7  _UART_bReadRxData
       06BA  bUART_ReadRxStatus
       06BA  _UART_bReadRxStatus
       06BA  _bUART_ReadRxStatus
       06BA  UART_bReadRxStatus
       06BD  _UART_TxIntMode
       06BD  UART_TxIntMode
       06D0  UART_IntCntl
       06D0  _UART_IntCntl
       06FB  UART_PutSHexByte
       06FB  _UART_PutSHexByte
       070E  _UART_PutSHexInt
       070E  UART_PutSHexInt
       0715  _UART_PutChar
       0715  UART_PutChar
       071D  UART_cGetChar
       071D  _UART_cGetChar
       0725  _UART_cReadChar
       0725  UART_cReadChar
       073C  UART_iReadChar
       073C  _UART_iReadChar
       0752  UART_PutString
       0752  _UART_PutString
       0764  UART_Write
       0764  _UART_Write
       078C  _UART_CWrite
       078C  UART_CWrite
       07B8  UART_CPutString
       07B8  _UART_CPutString
       07CA  UART_PutCRLF
       07CA  _UART_PutCRLF
       07D3  _UART_CmdReset
       07D3  UART_CmdReset
       07E9  UART_bCmdCheck
       07E9  _UART_bCmdCheck
       07F1  _UART_bErrCheck
       07F1  UART_bErrCheck
       07FC  UART_bCmdLength
       07FC  _UART_bCmdLength
       0802  _UART_szGetParam
       0802  UART_szGetParam
       0860  _UART_szGetRestOfParams
       0860  UART_szGetRestOfParams
       086B  _ServoA_ISR
       086C  ServoA_EnableInt
       086C  _ServoA_EnableInt
       0870  ServoA_DisableInt
       0870  _ServoA_DisableInt
       0874  ServoA_Start
       0874  _ServoA_Start
       0878  _ServoA_Stop
       0878  ServoA_Stop
       087C  ServoA_WritePeriod
       087C  _ServoA_WritePeriod
       0882  ServoA_WritePulseWidth
       0882  _ServoA_WritePulseWidth
       0888  wServoA_ReadPulseWidth
       0888  ServoA_wReadPulseWidth
       0888  _ServoA_wReadPulseWidth
       0888  _wServoA_ReadPulseWidth
       088E  wServoA_ReadCounter
       088E  _ServoA_wReadCounter
       088E  _wServoA_ReadCounter
       088E  ServoA_wReadCounter
       08C8  _PWMB_ISR
       08C9  PWMB_EnableInt
       08C9  _PWMB_EnableInt
       08CD  _PWMB_DisableInt
       08CD  PWMB_DisableInt
       08D1  PWMB_Start
       08D1  _PWMB_Start
       08D5  _PWMB_Stop
       08D5  PWMB_Stop
       08D9  _PWMB_WritePeriod
       08D9  PWMB_WritePeriod
       08DC  _PWMB_WritePulseWidth
       08DC  PWMB_WritePulseWidth
       08DF  _bPWMB_ReadPulseWidth
       08DF  _PWMB_bReadPulseWidth
       08DF  PWMB_bReadPulseWidth
       08DF  bPWMB_ReadPulseWidth
       08E2  PWMB_bReadCounter
       08E2  _PWMB_bReadCounter
       08E2  _bPWMB_ReadCounter
       08E2  bPWMB_ReadCounter
       090F  _PWMA_ISR
       0910  PWMA_EnableInt
       0910  _PWMA_EnableInt
       0914  _PWMA_DisableInt
       0914  PWMA_DisableInt
       0918  PWMA_Start
       0918  _PWMA_Start
       091C  PWMA_Stop
       091C  _PWMA_Stop
       0920  _PWMA_WritePeriod
       0920  PWMA_WritePeriod
       0923  _PWMA_WritePulseWidth
       0923  PWMA_WritePulseWidth
       0926  _PWMA_bReadPulseWidth
       0926  _bPWMA_ReadPulseWidth
       0926  PWMA_bReadPulseWidth
       0926  bPWMA_ReadPulseWidth
       0929  bPWMA_ReadCounter
       0929  _bPWMA_ReadCounter
       0929  _PWMA_bReadCounter
       0929  PWMA_bReadCounter
       0956  _ENC1B_PEDGE_EnableInt
       0956  ENC1B_PEDGE_EnableInt
       095A  _ENC1B_PEDGE_DisableInt
       095A  ENC1B_PEDGE_DisableInt
       095E  ENC1B_PEDGE_Start
       095E  _ENC1B_PEDGE_Start
       0962  ENC1B_PEDGE_Stop
       0962  _ENC1B_PEDGE_Stop
       0966  _ENC1B_FEDGE_ISR
       0967  ENC1B_FEDGE_EnableInt
       0967  _ENC1B_FEDGE_EnableInt
       096B  _ENC1B_FEDGE_DisableInt
       096B  ENC1B_FEDGE_DisableInt
       096F  ENC1B_FEDGE_Start
       096F  _ENC1B_FEDGE_Start
       099B  ENC1B_FEDGE_Stop
       099B  _ENC1B_FEDGE_Stop
       099F  _ENC1A_PEDGE_EnableInt
       099F  ENC1A_PEDGE_EnableInt
       09A3  _ENC1A_PEDGE_DisableInt
       09A3  ENC1A_PEDGE_DisableInt
       09A7  _ENC1A_PEDGE_Start
       09A7  ENC1A_PEDGE_Start
       09AB  _ENC1A_PEDGE_Stop
       09AB  ENC1A_PEDGE_Stop
       09AF  ENC1A_FEDGE_EnableInt
       09AF  _ENC1A_FEDGE_EnableInt
       09B3  ENC1A_FEDGE_DisableInt
       09B3  _ENC1A_FEDGE_DisableInt
       09B7  _ENC1A_FEDGE_Start
       09B7  ENC1A_FEDGE_Start
       09E3  ENC1A_FEDGE_Stop
       09E3  _ENC1A_FEDGE_Stop
       09E7  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   09E7   08A7 =   2215. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       09E7  _main
       09E7  __text_start
       0AFA  _getVelocity
       0B04  _action
       0E46  _encoder1_ISR
       0E9A  _encoder2_ISR
       0F32  _atoi
       1073  _itoa
       124C  _isdigit
       126D  _isspace
       128E  __text_end
       128E  __xidata_start
       129A  __xidata_end

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
                            data   0000   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _count2
       001F  _count1
       0023  _i
       0025  _curPrt1
       0026  _command_flag
       0028  _prevPrt2
       0029  _curPrt2
       002A  _prevPrt1

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

