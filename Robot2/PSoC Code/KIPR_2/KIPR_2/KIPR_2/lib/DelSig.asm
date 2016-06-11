;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: DelSig.asm
;;   Version: 1.50, Updated on 2015/3/4 at 22:25:16
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Assembler source for the Delta-Sigma A/D Converter User
;;               Module with 2nd-order modulator based on the Type 2 Decimator.
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API
;;        functions returns. For Large Memory Model devices it is also the
;;        caller's responsibility to perserve any value in the CUR_PP, IDX_PP,
;;        MVR_PP and MVW_PP registers. Even though some of these registers may
;;        not be modified now, there is no guarantee that will remain the case
;;        in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "DelSig.inc"


;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  DelSig_Start
export _DelSig_Start
export  DelSig_SetPower
export _DelSig_SetPower
export  DelSig_Stop
export _DelSig_Stop
export  DelSig_StartAD
export _DelSig_StartAD
export  DelSig_StopAD
export _DelSig_StopAD
export  DelSig_fIsDataAvailable
export _DelSig_fIsDataAvailable
export  DelSig_iGetDataClearFlag
export _DelSig_iGetDataClearFlag
export  DelSig_wGetDataClearFlag
export _DelSig_wGetDataClearFlag
export  DelSig_iGetData
export _DelSig_iGetData
export  DelSig_wGetData
export _DelSig_wGetData
export  DelSig_ClearFlag
export _DelSig_ClearFlag
export  DelSig_WritePulseWidth
export _DelSig_WritePulseWidth


;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------

CONTROL_REG_ENABLE_BIT:                    equ  01h     ; Control register start bit
POWERMASK:                                 equ  03h     ; Analog PSoC Block Power bits
MSB:                                       equ  0
LSB:                                       equ  1


AREA UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_Start
;  FUNCTION NAME: DelSig_SetPower
;
;  DESCRIPTION: Applies power setting to the module's analog PSoc blocks.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    The A register contains the power setting.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;                RAM use class 2: page pointer registers are not modified.
;
 DelSig_Start:
_DelSig_Start:
 DelSig_SetPower:
_DelSig_SetPower:
   RAM_PROLOGUE RAM_USE_CLASS_2
   mov  X, SP                                    ; Set up Stack frame
   and  A, POWERMASK                             ; Ensure value is legal
   push A
   mov  A, reg[DelSig_AtoD1cr3]                  ; First SC block:
   and  A, ~POWERMASK                            ;   clear power bits to zero
   or   A, [ X ]                                 ;   establish new value
   mov  reg[DelSig_AtoD1cr3], A                  ;   change the actual setting
   mov  A, reg[DelSig_AtoD2cr3]                  ; Second SC block: as previous
   and  A, ~POWERMASK
   or   A, [ X ]
   mov  reg[DelSig_AtoD2cr3], A
   pop  A
   RAM_EPILOGUE RAM_USE_CLASS_2
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_Stop
;
;  DESCRIPTION:   Removes power from the module's analog PSoc blocks.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;                RAM use class 1: page pointer registers are not modified.
;
 DelSig_Stop:
_DelSig_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1
   and  reg[DelSig_AtoD1cr3], ~POWERMASK
   and  reg[DelSig_AtoD2cr3], ~POWERMASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_StartAD
;
;  DESCRIPTION: Activates interrupts for this user module and begins sampling.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;                RAM use class 1: page pointer registers may be modified.
;
 DelSig_StartAD:
_DelSig_StartAD:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_EnableIntMask DelSig_INT_REG, DelSig_INT_MASK
   mov  reg[DelSig_PWM_CR0], CONTROL_REG_ENABLE_BIT
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_StopAD
;
;  DESCRIPTION: Shuts down the A/D is an orderly manner.  The PWM stops
;               operating and it's interrupt is disabled. Analog power is
;               still supplied to the analog blocks, however.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;                RAM use class 1: page pointer registers are not modified.
;
 DelSig_StopAD:
_DelSig_StopAD:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov  reg[DelSig_PWM_CR0], 00h                     ; Disable the PWM
   M8C_DisableIntMask DelSig_INT_REG, DelSig_INT_MASK   ; Disable its interrupt
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_fIsDataAvailable
;
;  DESCRIPTION: Returns the status of the A/D Data
;-----------------------------------------------------------------------------
;  ARGUMENTS:    None.
;  RETURNS:      fastcall16 BOOL DataAvailable returned in the A register
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER
;    REGISTERS WILL NOT BE MODIFIED.
;
;    Page Pointer Registers Modified:
;          CUR_PP
;
 DelSig_fIsDataAvailable:
_DelSig_fIsDataAvailable:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >DelSig_bfStatus
   mov  A, [DelSig_bfStatus]
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME:  DelSig_iGetDataClearFlag
;
;  DESCRIPTION:    Returns the data from the A/D.  Does not check if data is
;                  available. Also clears the DATA_READY flag.
;-----------------------------------------------------------------------------
;  ARGUMENTS:    None.
;  RETURNS:      fastcall16 INT iData (LSB in A, MSB in X)
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER
;    REGISTERS WILL NOT BE MODIFIED.
;
;    Page Pointer Registers Modified:
;          CUR_PP
;
;    PWM interrupts are momentarily halted and restarted to
;    ensure data integrity.
;
 DelSig_iGetDataClearFlag:
_DelSig_iGetDataClearFlag:
 DelSig_wGetDataClearFlag:
_DelSig_wGetDataClearFlag:
   ; Note, data format is determined by the ISR.
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >DelSig_bfStatus
   M8C_DisableIntMask DelSig_INT_REG, DelSig_INT_MASK
   and  [DelSig_bfStatus], ~DelSig_DATA_READY_BIT
   mov  X, [DelSig_iResult+MSB]
   mov  A, [DelSig_iResult+LSB]
   M8C_EnableIntMask DelSig_INT_REG, DelSig_INT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME:  DelSig_iGetData:
;
;  DESCRIPTION:     Returns the data from the A/D.  Does not check if data is
;                   available.
;-----------------------------------------------------------------------------
;  ARGUMENTS:    None.
;  RETURNS:      fastcall16 INT iData (LSB in A, MSB in X)
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER
;    REGISTERS WILL NOT BE MODIFIED.
;
;    Page Pointer Registers Modified:
;          CUR_PP
;
;    PWM interrupts are momentarily halted and restarted to
;    ensure data integrity.
;
 DelSig_iGetData:
_DelSig_iGetData:
 DelSig_wGetData:
_DelSig_wGetData:
   ; Note, data format is determined by the ISR.
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >DelSig_iResult
   M8C_DisableIntMask DelSig_INT_REG, DelSig_INT_MASK
   mov  X, [DelSig_iResult+MSB]
   mov  A, [DelSig_iResult+LSB]
   M8C_EnableIntMask DelSig_INT_REG, DelSig_INT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_ClearFlag
;
;  DESCRIPTION: Clears the data ready flag.
;-----------------------------------------------------------------------------
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;    IN THE LARGE MEMORY MODEL CURRENTLY ONLY THE PAGE POINTER
;    REGISTERS LISTED BELOW ARE MODIFIED.  THIS DOES NOT GUARANTEE
;    THAT IN FUTURE IMPLEMENTATIONS OF THIS FUNCTION OTHER PAGE POINTER
;    REGISTERS WILL NOT BE MODIFIED.
;
;    Page Pointer Registers Modified:
;          CUR_PP
;
 DelSig_ClearFlag:
_DelSig_ClearFlag:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >DelSig_bfStatus
   and  [DelSig_bfStatus], ~DelSig_DATA_READY_BIT
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: DelSig_WritePulseWidth
;
;  DESCRIPTION:
;     Write the 8-bit compare value into the compare register (DR2).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    fastcall16 BYTE bPulseWidth (passed in A)
;  RETURNS:      Nothing
;  SIDE EFFECTS:
;      REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;      RAM use class 1: page pointer registers are not modified.
;      This function can produce momentary glitches in the PWM output. This
;      effect can be avoided by calling DelSig_StopAD and
;      DelSig_StartAD before and after the call to this function.
;      As usual, the first two samples following such a start up action will
;      will contain invalid values.
;
 DelSig_WritePulseWidth:
_DelSig_WritePulseWidth:
    RAM_PROLOGUE RAM_USE_CLASS_1
    mov   reg[DelSig_PWM_DR2],A
    RAM_EPILOGUE RAM_USE_CLASS_1
    ret
.ENDSECTION


; End of File DelSig.asm
