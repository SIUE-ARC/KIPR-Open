//*****************************************************************************
//*****************************************************************************
//  FILENAME: Servo0.h
//   Version: 2.5, Updated on 2015/3/4 at 22:26:51
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: PWM16 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef Servo0_INCLUDE
#define Servo0_INCLUDE

#include <m8c.h>

#pragma fastcall16 Servo0_EnableInt
#pragma fastcall16 Servo0_DisableInt
#pragma fastcall16 Servo0_Start
#pragma fastcall16 Servo0_Stop
#pragma fastcall16 Servo0_wReadCounter              // Read  DR0
#pragma fastcall16 Servo0_WritePeriod               // Write DR1
#pragma fastcall16 Servo0_wReadPulseWidth           // Read  DR2
#pragma fastcall16 Servo0_WritePulseWidth           // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wServo0_ReadCounter              // Read  DR0 (Deprecated)
#pragma fastcall16 wServo0_ReadPulseWidth           // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the Servo0 API.
//-------------------------------------------------

extern void Servo0_EnableInt(void);                  // Proxy Class 1
extern void Servo0_DisableInt(void);                 // Proxy Class 1
extern void Servo0_Start(void);                      // Proxy Class 1
extern void Servo0_Stop(void);                       // Proxy Class 1
extern WORD Servo0_wReadCounter(void);               // Proxy Class 2
extern void Servo0_WritePeriod(WORD wPeriod);        // Proxy Class 1
extern WORD Servo0_wReadPulseWidth(void);            // Proxy Class 1
extern void Servo0_WritePulseWidth(WORD wPulseWidth);// Proxy Class 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wServo0_ReadCounter(void);            // Deprecated
extern WORD wServo0_ReadPulseWidth(void);         // Deprecated


//-------------------------------------------------
// Constants for Servo0 API's.
//-------------------------------------------------

#define Servo0_CONTROL_REG_START_BIT           ( 0x01 )
#define Servo0_INT_REG_ADDR                    ( 0x0e1 )
#define Servo0_INT_MASK                        ( 0x04 )


//--------------------------------------------------
// Constants for Servo0 user defined values
//--------------------------------------------------

#define Servo0_PERIOD                          ( 0x4e1f )
#define Servo0_PULSE_WIDTH                     ( 0x3e7 )


//-------------------------------------------------
// Register Addresses for Servo0
//-------------------------------------------------

#pragma ioport  Servo0_COUNTER_LSB_REG: 0x024              //DR0 Count register LSB
BYTE            Servo0_COUNTER_LSB_REG;
#pragma ioport  Servo0_COUNTER_MSB_REG: 0x028              //DR0 Count register MSB
BYTE            Servo0_COUNTER_MSB_REG;
#pragma ioport  Servo0_PERIOD_LSB_REG:  0x025              //DR1 Period register LSB
BYTE            Servo0_PERIOD_LSB_REG;
#pragma ioport  Servo0_PERIOD_MSB_REG:  0x029              //DR1 Period register MSB
BYTE            Servo0_PERIOD_MSB_REG;
#pragma ioport  Servo0_COMPARE_LSB_REG: 0x026              //DR2 Compare register LSB
BYTE            Servo0_COMPARE_LSB_REG;
#pragma ioport  Servo0_COMPARE_MSB_REG: 0x02a              //DR2 Compare register MSB
BYTE            Servo0_COMPARE_MSB_REG;
#pragma ioport  Servo0_CONTROL_LSB_REG: 0x027              //Control register LSB
BYTE            Servo0_CONTROL_LSB_REG;
#pragma ioport  Servo0_CONTROL_MSB_REG: 0x02b              //Control register MSB
BYTE            Servo0_CONTROL_MSB_REG;
#pragma ioport  Servo0_FUNC_LSB_REG:    0x124              //Function register LSB
BYTE            Servo0_FUNC_LSB_REG;
#pragma ioport  Servo0_FUNC_MSB_REG:    0x128              //Function register MSB
BYTE            Servo0_FUNC_MSB_REG;
#pragma ioport  Servo0_INPUT_LSB_REG:   0x125              //Input register LSB
BYTE            Servo0_INPUT_LSB_REG;
#pragma ioport  Servo0_INPUT_MSB_REG:   0x129              //Input register MSB
BYTE            Servo0_INPUT_MSB_REG;
#pragma ioport  Servo0_OUTPUT_LSB_REG:  0x126              //Output register LSB
BYTE            Servo0_OUTPUT_LSB_REG;
#pragma ioport  Servo0_OUTPUT_MSB_REG:  0x12a              //Output register MSB
BYTE            Servo0_OUTPUT_MSB_REG;
#pragma ioport  Servo0_INT_REG:       0x0e1                //Interrupt Mask Register
BYTE            Servo0_INT_REG;


//-------------------------------------------------
// Servo0 Macro 'Functions'
//-------------------------------------------------

#define Servo0_Start_M \
   ( Servo0_CONTROL_LSB_REG |=  Servo0_CONTROL_REG_START_BIT )

#define Servo0_Stop_M  \
   ( Servo0_CONTROL_LSB_REG &= ~Servo0_CONTROL_REG_START_BIT )

#define Servo0_EnableInt_M   \
   M8C_EnableIntMask(  Servo0_INT_REG, Servo0_INT_MASK )

#define Servo0_DisableInt_M  \
   M8C_DisableIntMask( Servo0_INT_REG, Servo0_INT_MASK )

#endif
// end of file Servo0.h