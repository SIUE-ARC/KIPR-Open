;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME:   Reflect0_ADC.asm
;;  Version: 1.5, Updated on 2015/3/4 at 22:26:56
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION:  SAR6 User Module software implementation file.
;;
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************
include "m8c.inc"
include "memory.inc"
include "Reflect0_ADC.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  Reflect0_ADC_Start
export _Reflect0_ADC_Start
export  Reflect0_ADC_SetPower
export _Reflect0_ADC_SetPower
export  Reflect0_ADC_cGetSample
export _Reflect0_ADC_cGetSample
export  Reflect0_ADC_Stop
export _Reflect0_ADC_Stop


;-----------------------------------------------
; WARNING! These exports will be removed in
; a future release.
;-----------------------------------------------
export  Reflect0_ADC_GetSample
export _Reflect0_ADC_GetSample

;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------
bPWRMASK:  equ 03h              ; Power bitfield in Switched Cap CR3 reg

AREA UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Reflect0_ADC_Start
;  FUNCTION NAME: Reflect0_ADC_SetPower
;
;  DESCRIPTION:
;     Applies power setting to the module's SoCblocs
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    A   contains the power setting 0=Off, 1=Low, 2=Med, 3=High
;
;  RETURNS:  NA
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Reflect0_ADC_Start:
_Reflect0_ADC_Start:
    ;; Initialization-time only code goes here.

 Reflect0_ADC_SetPower:
_Reflect0_ADC_SetPower:
    RAM_PROLOGUE RAM_USE_CLASS_2
    and   A, bPWRMASK       ; trim to bits of interest
    mov   X, SP             ; Set stack frame pointer
    push  A

    ;; read CR3 register, modify power bits & write back
    mov   A, reg[Reflect0_ADC_CR3]
    and   A, ~bPWRMASK      ; clear old setting
    or    A, [X]            ; set power in register image
    mov   reg[Reflect0_ADC_CR3], A
    pop   A
    RAM_EPILOGUE RAM_USE_CLASS_2
    ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Reflect0_ADC_cGetSample
;
;  DESCRIPTION:
;    Utilize SAR acceleration hardware to guide a binary search
;    until the output of the 6-bit DAC output is within 1 bit of the
;    input voltage.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;
;  RETURNS:
;    A   2's Complement Value in [-32..+31]
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
PSOC_ANALOG_COL_MASK:  equ 0Ch ; mask for column bits in analog reg address
PSOC_SAR_CTRL:         equ 68h ;
PSOC_SAR_MAGNITUDE:    equ 1Fh ;
PSOC_SAR_SIGN:         equ 20h ;

 Reflect0_ADC_cGetSample:
_Reflect0_ADC_cGetSample:
 Reflect0_ADC_GetSample:  ; WARNING, this label will be removed in a future release.
_Reflect0_ADC_GetSample:  ; WARNING, this label will be removed in a future release.
    RAM_PROLOGUE RAM_USE_CLASS_1

    ; These three lines of code are VERY important to ensure proper SAR6 operation.
    ; 1) The first line will make sure the CPU is stalled when a value is written
    ;    to the analog switch cap register.
    ; 2) Write the inital value to CR0
    ; 3) Setup the Analog Synchronization Control Register so that the next
    ;    six "or" commands work with the SAR hardware to perform a conversion.

    mov  reg[ASY_CR],ASY_CR_SYNCEN
    mov  reg[Reflect0_ADC_CR0], Reflect0_ADC_CR0_INIT
    mov  reg[ASY_CR], PSOC_SAR_CTRL | Reflect0_ADC_SCCOL_MASK


    ;; Drive the binary search engine with read/modify/write instructions.
    ;; NOTE: each of the next 6 instructions stalls the CPU consuming one
    ;; complete analog column clock cycle (input clock divided by 4).
    or   reg[Reflect0_ADC_CR0], 0   ; set sign & try MSB of magnitude
    or   reg[Reflect0_ADC_CR0], 0   ; set MSB of magnitude and try next lower
    or   reg[Reflect0_ADC_CR0], 0   ;                      ... and next ...
    or   reg[Reflect0_ADC_CR0], 0   ;                      ... and next ...
    or   reg[Reflect0_ADC_CR0], 0   ;                      ... and try LSB
    or   reg[Reflect0_ADC_CR0], 0   ; and, finally, set LSB of magnitude.

    ;; Conversion is done, translate the result to 1-byte 2's complement form.
    ;; Negative and positive values are handled differently. To minimize
    ;; aperature jitter, the execution cycles consumed in each case have been
    ;; equalized. The cost of this is 13 cycles for positive values; 5 cycles
    ;; for negative values.
    mov  A, reg[Reflect0_ADC_CR0]
    and  A, PSOC_SAR_MAGNITUDE
    tst  reg[Reflect0_ADC_CR0], PSOC_SAR_SIGN
    jnz  GSNegative  ; Result is zero => sign was 1 (negative).
    nop              ; Delay to equalize number of required cycles.
    RAM_EPILOGUE RAM_USE_CLASS_1
    ret
GSNegative:
    cpl  A           ; Take 1's complement of the magnitude
    RAM_EPILOGUE RAM_USE_CLASS_1
    ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Reflect0_ADC_Stop
;
;  DESCRIPTION:
;    Removes power from the switch cap block
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  None
;
;  RETURNS: NA
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Reflect0_ADC_Stop:
_Reflect0_ADC_Stop:
    RAM_PROLOGUE RAM_USE_CLASS_1
    and reg[Reflect0_ADC_CR3], ~bPWRMASK
    RAM_EPILOGUE RAM_USE_CLASS_1
    ret
.ENDSECTION

; End of File Reflect0_ADC.asm
