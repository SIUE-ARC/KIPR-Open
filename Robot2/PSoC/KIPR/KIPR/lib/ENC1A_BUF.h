//*****************************************************************************
//*****************************************************************************
//  FILENAME: ENC1A_BUF.h
//  Version: 1.3, Updated on 2015/3/4 at 22:26:4
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: DigitalBuffers User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef ENC1A_BUF_INCLUDE
#define ENC1A_BUF_INCLUDE

#include <m8c.h>

#pragma fastcall16 ENC1A_BUF_EnableInt
#pragma fastcall16 ENC1A_BUF_DisableInt
#pragma fastcall16 ENC1A_BUF_Start
#pragma fastcall16 ENC1A_BUF_Stop

//-------------------------------------------------
// Prototypes of the ENC1A_BUF API.
//-------------------------------------------------

extern void ENC1A_BUF_EnableInt(void);
extern void ENC1A_BUF_DisableInt(void);
extern void ENC1A_BUF_Start(void);
extern void ENC1A_BUF_Stop(void);


//--------------------------------------------------
// Constants for ENC1A_BUF API's.
//--------------------------------------------------
#define ENC1A_BUF_CONTROL_REG_START_BIT        ( 0x01 )
#define ENC1A_BUF_INT_REG_ADDR                 ( 0x0e1 )
#define ENC1A_BUF_INT_MASK                     ( 0x01 )


//--------------------------------------------------
// Constants for ENC1A_BUF user defined values
//--------------------------------------------------
#pragma ioport  ENC1A_BUF_DATA_0_REG:   0x020              //DR0 Count register
BYTE            ENC1A_BUF_DATA_0_REG;
#pragma ioport  ENC1A_BUF_DATA_1_REG:   0x021              //DR1 Period register
BYTE            ENC1A_BUF_DATA_1_REG;
#pragma ioport  ENC1A_BUF_DATA_2_REG:   0x022              //DR2 Compare register
BYTE            ENC1A_BUF_DATA_2_REG;
#pragma ioport  ENC1A_BUF_CONTROL_REG:  0x023              //Control register
BYTE            ENC1A_BUF_CONTROL_REG;
#pragma ioport  ENC1A_BUF_FUNC_REG: 0x120                  //Function register
BYTE            ENC1A_BUF_FUNC_REG;
#pragma ioport  ENC1A_BUF_INPUT_REG:    0x121              //Input register
BYTE            ENC1A_BUF_INPUT_REG;
#pragma ioport  ENC1A_BUF_OUTPUT_REG:   0x122              //Output register
BYTE            ENC1A_BUF_OUTPUT_REG;
#pragma ioport  ENC1A_BUF_INT_REG:       0x0e1             //Interrupt Mask Register
BYTE            ENC1A_BUF_INT_REG;


//-------------------------------------------------
// Register Addresses for ENC1A_BUF
//-------------------------------------------------


//-------------------------------------------------
// ENC1A_BUF Macro 'Functions'
//-------------------------------------------------

#define ENC1A_BUF_Start_M \
   ENC1A_BUF_CONTROL_REG |=  ENC1A_BUF_CONTROL_REG_START_BIT

#define ENC1A_BUF_Stop_M  \
   ENC1A_BUF_CONTROL_REG &= ~ENC1A_BUF_CONTROL_REG_START_BIT

#define ENC1A_BUF_EnableInt_M   \
   M8C_EnableIntMask(ENC1A_BUF_INT_REG, ENC1A_BUF_INT_MASK)

#define ENC1A_BUF_DisableInt_M  \
   M8C_DisableIntMask(ENC1A_BUF_INT_REG, ENC1A_BUF_INT_MASK)

#endif
// end of file ENC1A_BUF.h