//*****************************************************************************
//*****************************************************************************
//  FILENAME: UltraSonic.h
//   Version: 2.6, Updated on 2015/3/4 at 22:27:48
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: Timer32 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef UltraSonic_INCLUDE
#define UltraSonic_INCLUDE

#include <m8c.h>

#pragma fastcall16 UltraSonic_EnableInt
#pragma fastcall16 UltraSonic_DisableInt
#pragma fastcall16 UltraSonic_Start
#pragma fastcall16 UltraSonic_Stop
#pragma fastcall16 UltraSonic_ReadTimer               // Read  DR0
#pragma fastcall16 UltraSonic_ReadTimerSaveCV         // Read  DR0
#pragma fastcall16 UltraSonic_WritePeriod             // Write DR1
#pragma fastcall16 UltraSonic_ReadCompareValue        // Read  DR2
#pragma fastcall16 UltraSonic_WriteCompareValue       // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 UltraSonic_ReadCounter              // Read  DR0 "Obsolete"
#pragma fastcall16 UltraSonic_CaptureCounter           // Read  DR0 "Obsolete"


//-------------------------------------------------
// Prototypes of the UltraSonic API.
//-------------------------------------------------

extern void UltraSonic_EnableInt(void);                                    // Proxy Class 1
extern void UltraSonic_DisableInt(void);                                   // Proxy Class 1
extern void UltraSonic_Start(void);                                        // Proxy Class 1
extern void UltraSonic_Stop(void);                                         // Proxy Class 1
extern void UltraSonic_ReadTimer(DWORD * pdwCount);                        // Proxy Class 3
extern void UltraSonic_ReadTimerSaveCV(DWORD * pdwCount);                  // Proxy Class 3
extern void UltraSonic_WritePeriod(DWORD dwPeriod);                        // Proxy Class 2
extern void UltraSonic_ReadCompareValue(DWORD * pdwCompareValue);          // Proxy Class 3
extern void UltraSonic_WriteCompareValue(DWORD dwCompareValue);            // Proxy Class 2

// The following functions are deprecated.
// They may be omitted in future releases
//
extern void UltraSonic_ReadCounter(DWORD * pdwCount);          // Obsolete
extern void UltraSonic_CaptureCounter(DWORD * pdwCount);       // Obsolete


//--------------------------------------------------
// Constants for UltraSonic API's.
//--------------------------------------------------

#define UltraSonic_CONTROL_REG_START_BIT       ( 0x01 )
#define UltraSonic_INT_REG_ADDR                ( 0x0df )
#define UltraSonic_INT_MASK                    ( 0x80 )


//--------------------------------------------------
// Constants for UltraSonic user defined values
//--------------------------------------------------

#define UltraSonic_PERIOD                      ( 0xffffffff )
#define UltraSonic_COMPARE_VALUE               ( 0x0 )


//-------------------------------------------------
// Register Addresses for UltraSonic
//-------------------------------------------------

#pragma ioport  UltraSonic_COUNTER_LSB_REG: 0x050          //Count register LSB
BYTE            UltraSonic_COUNTER_LSB_REG;
#pragma ioport  UltraSonic_COUNTER_ISB1_REG:    0x054      //Count register ISB1
BYTE            UltraSonic_COUNTER_ISB1_REG;
#pragma ioport  UltraSonic_COUNTER_ISB2_REG:    0x058      //Count register ISB2
BYTE            UltraSonic_COUNTER_ISB2_REG;
#pragma ioport  UltraSonic_COUNTER_MSB_REG: 0x05c          //Count register MSB
BYTE            UltraSonic_COUNTER_MSB_REG;
#pragma ioport  UltraSonic_PERIOD_LSB_REG:  0x051          //Period register LSB
BYTE            UltraSonic_PERIOD_LSB_REG;
#pragma ioport  UltraSonic_PERIOD_ISB1_REG: 0x055          //Period register ISB1
BYTE            UltraSonic_PERIOD_ISB1_REG;
#pragma ioport  UltraSonic_PERIOD_ISB2_REG: 0x059          //Period register ISB2
BYTE            UltraSonic_PERIOD_ISB2_REG;
#pragma ioport  UltraSonic_PERIOD_MSB_REG:  0x05d          //Period register MSB
BYTE            UltraSonic_PERIOD_MSB_REG;
#pragma ioport  UltraSonic_COMPARE_LSB_REG: 0x052          //Compare register LSB
BYTE            UltraSonic_COMPARE_LSB_REG;
#pragma ioport  UltraSonic_COMPARE_ISB1_REG:    0x056      //Compare register ISB1
BYTE            UltraSonic_COMPARE_ISB1_REG;
#pragma ioport  UltraSonic_COMPARE_ISB2_REG:    0x05a      //Compare register ISB2
BYTE            UltraSonic_COMPARE_ISB2_REG;
#pragma ioport  UltraSonic_COMPARE_MSB_REG: 0x05e          //Compare register MSB
BYTE            UltraSonic_COMPARE_MSB_REG;
#pragma ioport  UltraSonic_CONTROL_LSB_REG: 0x053          //Control register LSB
BYTE            UltraSonic_CONTROL_LSB_REG;
#pragma ioport  UltraSonic_CONTROL_ISB1_REG:    0x057      //Control register ISB1
BYTE            UltraSonic_CONTROL_ISB1_REG;
#pragma ioport  UltraSonic_CONTROL_ISB2_REG:    0x05b      //Control register ISB2
BYTE            UltraSonic_CONTROL_ISB2_REG;
#pragma ioport  UltraSonic_CONTROL_MSB_REG: 0x05f          //Control register MSB
BYTE            UltraSonic_CONTROL_MSB_REG;
#pragma ioport  UltraSonic_FUNC_LSB_REG:    0x150          //Function register LSB
BYTE            UltraSonic_FUNC_LSB_REG;
#pragma ioport  UltraSonic_FUNC_ISB1_REG:   0x154          //Function register ISB1
BYTE            UltraSonic_FUNC_ISB1_REG;
#pragma ioport  UltraSonic_FUNC_ISB2_REG:   0x158          //Function register ISB2
BYTE            UltraSonic_FUNC_ISB2_REG;
#pragma ioport  UltraSonic_FUNC_MSB_REG:    0x15c          //Function register MSB
BYTE            UltraSonic_FUNC_MSB_REG;
#pragma ioport  UltraSonic_INPUT_LSB_REG:   0x151          //Input register LSB
BYTE            UltraSonic_INPUT_LSB_REG;
#pragma ioport  UltraSonic_INPUT_ISB1_REG:  0x155          //Input register ISB1
BYTE            UltraSonic_INPUT_ISB1_REG;
#pragma ioport  UltraSonic_INPUT_ISB2_REG:  0x159          //Input register ISB2
BYTE            UltraSonic_INPUT_ISB2_REG;
#pragma ioport  UltraSonic_INPUT_MSB_REG:   0x15d          //Input register MSB
BYTE            UltraSonic_INPUT_MSB_REG;
#pragma ioport  UltraSonic_OUTPUT_LSB_REG:  0x152          //Output register LSB
BYTE            UltraSonic_OUTPUT_LSB_REG;
#pragma ioport  UltraSonic_OUTPUT_ISB1_REG: 0x156          //Output register ISB1
BYTE            UltraSonic_OUTPUT_ISB1_REG;
#pragma ioport  UltraSonic_OUTPUT_ISB2_REG: 0x15a          //Output register ISB2
BYTE            UltraSonic_OUTPUT_ISB2_REG;
#pragma ioport  UltraSonic_OUTPUT_MSB_REG:  0x15e          //Output register MSB
BYTE            UltraSonic_OUTPUT_MSB_REG;
#pragma ioport  UltraSonic_INT_REG:       0x0df            //Interrupt Mask Register
BYTE            UltraSonic_INT_REG;


//-------------------------------------------------
// UltraSonic Macro 'Functions'
//-------------------------------------------------

#define UltraSonic_Start_M \
   ( UltraSonic_CONTROL_LSB_REG |=  UltraSonic_CONTROL_REG_START_BIT )

#define UltraSonic_Stop_M  \
   ( UltraSonic_CONTROL_LSB_REG &= ~UltraSonic_CONTROL_REG_START_BIT )

#define UltraSonic_EnableInt_M   \
   M8C_EnableIntMask(  UltraSonic_INT_REG, UltraSonic_INT_MASK )

#define UltraSonic_DisableInt_M  \
   M8C_DisableIntMask( UltraSonic_INT_REG, UltraSonic_INT_MASK )

#endif
// end of file UltraSonic.h