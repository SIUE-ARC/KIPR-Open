//*****************************************************************************
//*****************************************************************************
//  FILENAME: DelSig.h
//   Version: 1.50, Updated on 2015/3/4 at 22:25:16
//
//  DESCRIPTION:  C declarations for the DelSig User Module with a 2nd-order
//                modulator based on a type-2 dcecimator
//-----------------------------------------------------------------------------
//      Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef DelSig_INCLUDE
#define DelSig_INCLUDE

#include <m8c.h>

#pragma fastcall16 DelSig_Start
#pragma fastcall16 DelSig_SetPower
#pragma fastcall16 DelSig_StartAD
#pragma fastcall16 DelSig_StopAD
#pragma fastcall16 DelSig_Stop
#pragma fastcall16 DelSig_fIsDataAvailable
#pragma fastcall16 DelSig_iGetData
#pragma fastcall16 DelSig_wGetData
#pragma fastcall16 DelSig_iGetDataClearFlag
#pragma fastcall16 DelSig_wGetDataClearFlag
#pragma fastcall16 DelSig_ClearFlag
#pragma fastcall16 DelSig_WritePulseWidth

//-------------------------------------------------
// Prototypes of the DelSig API.
//-------------------------------------------------
extern void DelSig_Start(BYTE bPower);
extern void DelSig_SetPower(BYTE bPower);
extern void DelSig_StartAD(void);
extern void DelSig_StopAD(void);
extern void DelSig_Stop(void);
extern BOOL DelSig_fIsDataAvailable(void);
extern INT  DelSig_iGetData(void);
extern WORD DelSig_wGetData(void);
extern INT  DelSig_iGetDataClearFlag(void);
extern WORD DelSig_wGetDataClearFlag(void);
extern void DelSig_ClearFlag(void);
extern void DelSig_WritePulseWidth(BYTE wPulseWidthValue);

//-------------------------------------------------
// Defines for DelSig API's.
//-------------------------------------------------
#define DelSig_OFF                         (0)
#define DelSig_LOWPOWER                    (1)
#define DelSig_MEDPOWER                    (2)
#define DelSig_HIGHPOWER                   (3)

#define DelSig_DATA_READY_BIT              (0x10)
#define DelSig_2S_COMPLEMENT               (1)

//-------------------------------------------------
// Hardware Register Definitions
//-------------------------------------------------

#pragma ioport  DelSig_PWM_DR0: 0x050               //Time base Counter register
BYTE            DelSig_PWM_DR0;
#pragma ioport  DelSig_PWM_DR1: 0x051               //Time base Period value register
BYTE            DelSig_PWM_DR1;
#pragma ioport  DelSig_PWM_DR2: 0x052               //Time base CompareValue register
BYTE            DelSig_PWM_DR2;
#pragma ioport  DelSig_PWM_CR0: 0x053               //Time base Control register
BYTE            DelSig_PWM_CR0;
#pragma ioport  DelSig_PWM_FN:  0x150                //Time base Function register
BYTE            DelSig_PWM_FN;
#pragma ioport  DelSig_PWM_SL:  0x151                //Time base Input register
BYTE            DelSig_PWM_SL;
#pragma ioport  DelSig_PWM_OS:  0x152                //Time base Output register
BYTE            DelSig_PWM_OS;

#pragma ioport  DelSig_AtoD1cr0:    0x080              //Analog block 1 control register 0
BYTE            DelSig_AtoD1cr0;
#pragma ioport  DelSig_AtoD1cr1:    0x081              //Analog block 1 control register 1
BYTE            DelSig_AtoD1cr1;
#pragma ioport  DelSig_AtoD1cr2:    0x082              //Analog block 1 control register 2
BYTE            DelSig_AtoD1cr2;
#pragma ioport  DelSig_AtoD1cr3:    0x083              //Analog block 1 control register 3
BYTE            DelSig_AtoD1cr3;
#pragma ioport  DelSig_AtoD2cr0:    0x090              //Analog block 2 control register 0
BYTE            DelSig_AtoD2cr0;
#pragma ioport  DelSig_AtoD2cr1:    0x091              //Analog block 2 control register 1
BYTE            DelSig_AtoD2cr1;
#pragma ioport  DelSig_AtoD2cr2:    0x092              //Analog block 2 control register 2
BYTE            DelSig_AtoD2cr2;
#pragma ioport  DelSig_AtoD2cr3:    0x093              //Analog block 2 control register 3
BYTE            DelSig_AtoD2cr3;

#endif
// end of file DelSig.h
