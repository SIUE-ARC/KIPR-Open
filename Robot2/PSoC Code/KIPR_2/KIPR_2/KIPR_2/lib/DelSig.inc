;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: DelSig.inc
;;   Version: 1.50, Updated on 2014/7/14 at 8:11:19
;;
;;  DESCRIPTION: Assembler declarations for the Delta-Sigma A/D Converter
;;               with a 2nd-order modulator and based on a type 2 decimator.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2014. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"

;--------------------------------------------------
; Constants for DelSig API's.
;--------------------------------------------------

DelSig_INT_REG:                    equ  0dfh
DelSig_INT_MASK:                   equ  10h     ; Interrupt mask
DelSig_INT_CLR_REG:                equ  0dch

DelSig_OFF:                        equ  0
DelSig_LOWPOWER:                   equ  1
DelSig_MEDPOWER:                   equ  2
DelSig_HIGHPOWER:                  equ  3

DelSig_DATA_READY_BIT:             equ  10h
DelSig_2S_COMPLEMENT:              equ  1

;--------------------------------------------------
; Register Address Constants for DelSig
;--------------------------------------------------

DelSig_PWM_DR0:                    equ 0x50    ; Period reg
DelSig_PWM_DR1:                    equ 0x51    ; Down count reg
DelSig_PWM_DR2:                    equ 0x52    ; Compare reg
DelSig_PWM_CR0:                    equ 0x53    ; Control reg
DelSig_PWM_FN:                     equ 0x50        ; Function reg
DelSig_PWM_SL:                     equ 0x51        ; Input  select reg
DelSig_PWM_OS:                     equ 0x52        ; Output select reg

DelSig_AtoD1cr0:                   equ 0x80    ; SC Block 1 Control Reg 0
DelSig_AtoD1cr1:                   equ 0x81    ; SC Block 1 Control Reg 1
DelSig_AtoD1cr2:                   equ 0x82    ; SC Block 1 Control Reg 2
DelSig_AtoD1cr3:                   equ 0x83    ; SC Block 1 Control Reg 3
DelSig_AtoD2cr0:                   equ 0x90    ; SC Block 2 Control Reg 0
DelSig_AtoD2cr1:                   equ 0x91    ; SC Block 2 Control Reg 1
DelSig_AtoD2cr2:                   equ 0x92    ; SC Block 2 Control Reg 2
DelSig_AtoD2cr3:                   equ 0x93    ; SC Block 2 Control Reg 3


; end of file DelSig.inc
