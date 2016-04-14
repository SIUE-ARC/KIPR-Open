;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: ENC1B_FEDGE.asm
;;   Version: 1.60, Updated on 2014/7/14 at 8:13:31
;;  Generated by PSoC Designer 5.4.2946
;;
;;  DESCRIPTION: DigInv User Module software implementation file.
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2014. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "ENC1B_FEDGE.inc"
include "memory.inc"


;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export   ENC1B_FEDGE_EnableInt
export  _ENC1B_FEDGE_EnableInt
export   ENC1B_FEDGE_DisableInt
export  _ENC1B_FEDGE_DisableInt
export   ENC1B_FEDGE_Start
export  _ENC1B_FEDGE_Start
export   ENC1B_FEDGE_Stop
export  _ENC1B_FEDGE_Stop

;-----------------------------------------------
;  EQUATES
;-----------------------------------------------
bfCONTROL_REG_START_BIT:   equ   1     ; Control register start bit

area UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ENC1B_FEDGE_EnableInt
;
;  DESCRIPTION:
;     Enables this receiver's interrupt by setting the interrupt enable mask
;     bit associated with this User Module. Remember to call the global interrupt
;     enable function by using the macro: M8C_EnableGInt.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 ENC1B_FEDGE_EnableInt:
_ENC1B_FEDGE_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_EnableIntMask ENC1B_FEDGE_INT_REG, ENC1B_FEDGE_bINT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ENC1B_FEDGE_DisableInt
;
;  DESCRIPTION:
;     Disables this RX8's interrupt by clearing the interrupt enable mask bit
;     associated with this User Module.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 ENC1B_FEDGE_DisableInt:
_ENC1B_FEDGE_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_DisableIntMask ENC1B_FEDGE_INT_REG, ENC1B_FEDGE_bINT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ENC1B_FEDGE_Start
;
;  DESCRIPTION:
;     Sets the start bit in the Control register of this user module.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;
;     1) Save the Interrupt register
;     2) Save the Output register
;     3) Save the input register
;     4) Switch the output to Disabled - LOW
;     5) Disable Interrupt
;     6) Start the DigInv
;     7) Re-instate the input source
;     8) Re-instate the output
;     9) Re-instate the Interrupt register
;-----------------------------------------------------------------------------
 ENC1B_FEDGE_Start:
_ENC1B_FEDGE_Start:
   RAM_PROLOGUE RAM_USE_CLASS_1
   push  A

   ; The DigInv must see a positive clock edge in order to "start" itself
   ; in the correct state.  Once it sees a clock edge, it will follow its
   ; input source.  To do this, we disable outputs, switch the input source
   ; to the 48MHz clock, start the DigInv, re-instate the user's input source
   ; and then re-instate the output.

   ; disable the interrupt
   mov   A, REG[ENC1B_FEDGE_INT_REG]
   push  A

   M8C_DisableIntMask ENC1B_FEDGE_INT_REG, ENC1B_FEDGE_bINT_MASK

   M8C_SetBank1
   ; set the output to disable - will remain low!
   mov   A, REG[ENC1B_FEDGE_OUTPUT_REG]
   push  A

   mov   REG[ENC1B_FEDGE_OUTPUT_REG], 0

   ; set the input to the 48MHz clock
   mov   A, REG[ENC1B_FEDGE_INPUT_REG]
   push  A

   mov   REG[ENC1B_FEDGE_INPUT_REG], 04

   M8C_SetBank0
   ; start the inverter
   or    REG[ENC1B_FEDGE_CONTROL_REG], bfCONTROL_REG_START_BIT

   ; Re-instate the input
   M8C_SetBank1
   pop   A
   mov   REG[ENC1B_FEDGE_INPUT_REG], A

   ; Re-instate the output
   pop   A
   mov   REG[ENC1B_FEDGE_OUTPUT_REG], A
   M8C_SetBank0

   ;clear interrupt
   M8C_ClearIntFlag INT_CLR1, ENC1B_FEDGE_bINT_MASK

   ; Re-instate the interrupt state
   pop   A
   mov   REG[ENC1B_FEDGE_INT_REG], A

   ;Done!
   pop   A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ENC1B_FEDGE_Stop
;
;  DESCRIPTION:
;     Halts operation of the Digital Inverter.  Output is set LOW.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS: none
;
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 ENC1B_FEDGE_Stop:
_ENC1B_FEDGE_Stop:

   RAM_PROLOGUE RAM_USE_CLASS_1
   and   REG[ENC1B_FEDGE_CONTROL_REG], ~bfCONTROL_REG_START_BIT
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

; End of File ENC1B_FEDGE.asm



