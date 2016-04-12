//*****************************************************************************
//*****************************************************************************
//  FILENAME: ENC1B_FEDGE.h
//   Version: 1.60, Updated on 2015/3/4 at 22:26:5
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION:
//    ENC1B_FEDGE DigInverter User Module header file.
//-----------------------------------------------------------------------------
//      Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef ENC1B_FEDGE_INCLUDE
#define ENC1B_FEDGE_INCLUDE

#include <m8c.h>

/* Create pragmas to support proper argument and return value passing */
#pragma fastcall16  ENC1B_FEDGE_EnableInt
#pragma fastcall16  ENC1B_FEDGE_DisableInt
#pragma fastcall16  ENC1B_FEDGE_Start
#pragma fastcall16  ENC1B_FEDGE_Stop

//-------------------------------------------------
// Prototypes of the ENC1B_FEDGE API.
//-------------------------------------------------
extern void  ENC1B_FEDGE_EnableInt(void);           // Proxy Class 1
extern void  ENC1B_FEDGE_DisableInt(void);          // Proxy Class 1
extern void  ENC1B_FEDGE_Start(void);               // Proxy Class 1
extern void  ENC1B_FEDGE_Stop(void);                // Proxy Class 1

//-------------------------------------------------
// Hardware Register Definitions
//-------------------------------------------------
#pragma ioport  ENC1B_FEDGE_CONTROL_REG:    0x047
BYTE            ENC1B_FEDGE_CONTROL_REG;                   //Control register
#pragma ioport  ENC1B_FEDGE_COUNTER_REG:    0x044
BYTE            ENC1B_FEDGE_COUNTER_REG;                   //Counter register
#pragma ioport  ENC1B_FEDGE_PERIOD_REG: 0x045
BYTE            ENC1B_FEDGE_PERIOD_REG;                    //Period value register
#pragma ioport  ENC1B_FEDGE_COMPARE_REG:    0x046
BYTE            ENC1B_FEDGE_COMPARE_REG;                   //CompareValue register
#pragma ioport  ENC1B_FEDGE_FUNC_REG:   0x144
BYTE            ENC1B_FEDGE_FUNC_REG;                      //Function register
#pragma ioport  ENC1B_FEDGE_INPUT_REG:  0x145
BYTE            ENC1B_FEDGE_INPUT_REG;                     //Input register
#pragma ioport  ENC1B_FEDGE_OUTPUT_REG: 0x146
BYTE            ENC1B_FEDGE_OUTPUT_REG;                    //Output register

#endif
// end of file ENC1B_FEDGE.h