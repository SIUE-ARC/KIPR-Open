//*****************************************************************************
//*****************************************************************************
//  FILENAME: PseudoEncoder.h
//  Version: 1.3, Updated on 2015/3/4 at 22:26:4
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: DigitalBuffers User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef PseudoEncoder_INCLUDE
#define PseudoEncoder_INCLUDE

#include <m8c.h>

#pragma fastcall16 PseudoEncoder_EnableInt
#pragma fastcall16 PseudoEncoder_DisableInt
#pragma fastcall16 PseudoEncoder_Start
#pragma fastcall16 PseudoEncoder_Stop

//-------------------------------------------------
// Prototypes of the PseudoEncoder API.
//-------------------------------------------------

extern void PseudoEncoder_EnableInt(void);
extern void PseudoEncoder_DisableInt(void);
extern void PseudoEncoder_Start(void);
extern void PseudoEncoder_Stop(void);


//--------------------------------------------------
// Constants for PseudoEncoder API's.
//--------------------------------------------------
#define PseudoEncoder_CONTROL_REG_START_BIT    ( 0x01 )
#define PseudoEncoder_INT_REG_ADDR             ( 0x0df )
#define PseudoEncoder_INT_MASK                 ( 0x20 )


//--------------------------------------------------
// Constants for PseudoEncoder user defined values
//--------------------------------------------------
#pragma ioport  PseudoEncoder_DATA_0_REG:   0x054          //DR0 Count register
BYTE            PseudoEncoder_DATA_0_REG;
#pragma ioport  PseudoEncoder_DATA_1_REG:   0x055          //DR1 Period register
BYTE            PseudoEncoder_DATA_1_REG;
#pragma ioport  PseudoEncoder_DATA_2_REG:   0x056          //DR2 Compare register
BYTE            PseudoEncoder_DATA_2_REG;
#pragma ioport  PseudoEncoder_CONTROL_REG:  0x057          //Control register
BYTE            PseudoEncoder_CONTROL_REG;
#pragma ioport  PseudoEncoder_FUNC_REG: 0x154              //Function register
BYTE            PseudoEncoder_FUNC_REG;
#pragma ioport  PseudoEncoder_INPUT_REG:    0x155          //Input register
BYTE            PseudoEncoder_INPUT_REG;
#pragma ioport  PseudoEncoder_OUTPUT_REG:   0x156          //Output register
BYTE            PseudoEncoder_OUTPUT_REG;
#pragma ioport  PseudoEncoder_INT_REG:       0x0df         //Interrupt Mask Register
BYTE            PseudoEncoder_INT_REG;


//-------------------------------------------------
// Register Addresses for PseudoEncoder
//-------------------------------------------------


//-------------------------------------------------
// PseudoEncoder Macro 'Functions'
//-------------------------------------------------

#define PseudoEncoder_Start_M \
   PseudoEncoder_CONTROL_REG |=  PseudoEncoder_CONTROL_REG_START_BIT

#define PseudoEncoder_Stop_M  \
   PseudoEncoder_CONTROL_REG &= ~PseudoEncoder_CONTROL_REG_START_BIT

#define PseudoEncoder_EnableInt_M   \
   M8C_EnableIntMask(PseudoEncoder_INT_REG, PseudoEncoder_INT_MASK)

#define PseudoEncoder_DisableInt_M  \
   M8C_DisableIntMask(PseudoEncoder_INT_REG, PseudoEncoder_INT_MASK)

#endif
// end of file PseudoEncoder.h
