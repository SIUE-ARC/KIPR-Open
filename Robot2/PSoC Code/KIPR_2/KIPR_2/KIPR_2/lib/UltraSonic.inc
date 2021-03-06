;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: UltraSonic.inc
;;   Version: 2.6, Updated on 2015/3/4 at 22:27:47
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Assembler declarations for the Timer16 user module interface
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"


;--------------------------------------------------
; Constants for UltraSonic API's.
;--------------------------------------------------

UltraSonic_CONTROL_REG_START_BIT:          equ 0x01    ; Control register start bit
UltraSonic_INT_REG:                        equ 0x0df
UltraSonic_INT_MASK:                       equ 0x80


;--------------------------------------------------
; Constants for UltraSonic user defined values
;--------------------------------------------------

UltraSonic_PERIOD:                         equ 0x0
UltraSonic_COMPARE_VALUE:                  equ 0x0


;--------------------------------------------------
; Register Address Constants for UltraSonic
;--------------------------------------------------

UltraSonic_COUNTER_LSB_REG:            equ 0x58   ; DR0 Counter register
UltraSonic_COUNTER_MSB_REG:            equ 0x5c
UltraSonic_PERIOD_LSB_REG:             equ 0x59   ; DR1 Period register
UltraSonic_PERIOD_MSB_REG:             equ 0x5d
UltraSonic_COMPARE_LSB_REG:            equ 0x5a   ; DR2 CompareValue register
UltraSonic_COMPARE_MSB_REG:            equ 0x5e
UltraSonic_CONTROL_LSB_REG:            equ 0x5b   ; Control register
UltraSonic_CONTROL_MSB_REG:            equ 0x5f
UltraSonic_FUNC_LSB_REG:               equ 0x58   ; Function register
UltraSonic_FUNC_MSB_REG:               equ 0x5c
UltraSonic_INPUT_LSB_REG:              equ 0x59   ; Input register
UltraSonic_INPUT_MSB_REG:              equ 0x5d
UltraSonic_OUTPUT_LSB_REG:             equ 0x5a   ; Output register
UltraSonic_OUTPUT_MSB_REG:             equ 0x5e


;--------------------------------------------------
; UltraSonic Macro 'Functions'
;--------------------------------------------------

   macro UltraSonic_Start_M
   or    reg[UltraSonic_CONTROL_LSB_REG],  UltraSonic_CONTROL_REG_START_BIT
   endm

   macro UltraSonic_Stop_M
   and   reg[UltraSonic_CONTROL_LSB_REG], ~UltraSonic_CONTROL_REG_START_BIT
   endm

   macro UltraSonic_EnableInt_M
   M8C_EnableIntMask UltraSonic_INT_REG, UltraSonic_INT_MASK
   endm

   macro UltraSonic_DisableInt_M
   M8C_DisableIntMask UltraSonic_INT_REG, UltraSonic_INT_MASK
   endm


; end of file UltraSonic.inc
