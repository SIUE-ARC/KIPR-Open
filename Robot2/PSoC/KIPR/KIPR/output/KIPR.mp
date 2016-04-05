Project:      output/KIPR
Build Number: 0
Date:         Tue Apr 05 13:38:31 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00D4 =    212. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_kipr_2_Bank0
       021F  LoadConfigTBL_kipr_2_Bank1
       0274  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0274   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0274  __func_lit_start
       0276  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0276   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0276  LoadConfigTBL_kipr_2_Ordered
       037B  _LoadConfigInit
       037B  LoadConfigInit
       0382  _LoadConfig_kipr_2
       0382  LoadConfig_kipr_2
       03DD  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03DD   009A =    154. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03DD  _UART_TX_ISR
       03DE  _UART_RX_ISR
       0452  _ServoA_ISR
       0453  _PWMB_ISR
       0454  _PWMA_ISR
       0455  _ENC1B_BUF_ISR
       0456  ENC1B_BUF_EnableInt
       0456  _ENC1B_BUF_EnableInt
       045A  ENC1B_BUF_DisableInt
       045A  _ENC1B_BUF_DisableInt
       045E  ENC1B_BUF_Start
       045E  _ENC1B_BUF_Start
       0462  _ENC1B_BUF_Stop
       0462  ENC1B_BUF_Stop
       0466  _ENC1A_BUF_ISR
       0467  _ENC1A_BUF_EnableInt
       0467  ENC1A_BUF_EnableInt
       046B  _ENC1A_BUF_DisableInt
       046B  ENC1A_BUF_DisableInt
       046F  _ENC1A_BUF_Start
       046F  ENC1A_BUF_Start
       0473  ENC1A_BUF_Stop
       0473  _ENC1A_BUF_Stop
       0477  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0477   00DA =    218. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0477  __text_start
       0477  _main
       04A8  _encoder1_ISR
       04FC  _encoder2_ISR
       0550  PSoC_GPIO_ISR
       0551  __xidata_start
       0551  __text_end
       055B  __xidata_end

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
                        UART_RAM   0000   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  _UART_aRxBuffer
       0002  UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   001A   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       001A  __r1
       001B  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   000C =     12. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0012  _count1
       0016  _count2
       001C  _curPrt2
       001D  _prevPrt1
       001E  _curPrt1
       001F  _prevPrt2

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ uartint.asm, servoaint.asm, pwmbint.asm, pwmaint.asm, psocgpioint.asm, psocconfigtbl.asm, psocconfig.asm ]
[ enc1b_bufint.asm, enc1b_buf.asm, enc1a_bufint.asm, enc1a_buf.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x1a
-Bkipr_2_RAM
-rwh:SSCParmBlk:0xf7.0xff

