//*****************************************************************************
//*****************************************************************************
//  FILENAME: VelTimer.h
//   Version: 2.6, Updated on 2014/7/14 at 8:16:40
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: Timer32 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2014. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef VelTimer_INCLUDE
#define VelTimer_INCLUDE

#include <m8c.h>

#pragma fastcall16 VelTimer_EnableInt
#pragma fastcall16 VelTimer_DisableInt
#pragma fastcall16 VelTimer_Start
#pragma fastcall16 VelTimer_Stop
#pragma fastcall16 VelTimer_ReadTimer               // Read  DR0
#pragma fastcall16 VelTimer_ReadTimerSaveCV         // Read  DR0
#pragma fastcall16 VelTimer_WritePeriod             // Write DR1
#pragma fastcall16 VelTimer_ReadCompareValue        // Read  DR2
#pragma fastcall16 VelTimer_WriteCompareValue       // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 VelTimer_ReadCounter              // Read  DR0 "Obsolete"
#pragma fastcall16 VelTimer_CaptureCounter           // Read  DR0 "Obsolete"


//-------------------------------------------------
// Prototypes of the VelTimer API.
//-------------------------------------------------

extern void VelTimer_EnableInt(void);                                    // Proxy Class 1
extern void VelTimer_DisableInt(void);                                   // Proxy Class 1
extern void VelTimer_Start(void);                                        // Proxy Class 1
extern void VelTimer_Stop(void);                                         // Proxy Class 1
extern void VelTimer_ReadTimer(DWORD * pdwCount);                        // Proxy Class 3
extern void VelTimer_ReadTimerSaveCV(DWORD * pdwCount);                  // Proxy Class 3
extern void VelTimer_WritePeriod(DWORD dwPeriod);                        // Proxy Class 2
extern void VelTimer_ReadCompareValue(DWORD * pdwCompareValue);          // Proxy Class 3
extern void VelTimer_WriteCompareValue(DWORD dwCompareValue);            // Proxy Class 2

// The following functions are deprecated.
// They may be omitted in future releases
//
extern void VelTimer_ReadCounter(DWORD * pdwCount);          // Obsolete
extern void VelTimer_CaptureCounter(DWORD * pdwCount);       // Obsolete


//--------------------------------------------------
// Constants for VelTimer API's.
//--------------------------------------------------

#define VelTimer_CONTROL_REG_START_BIT         ( 0x01 )
#define VelTimer_INT_REG_ADDR                  ( 0x0df )
#define VelTimer_INT_MASK                      ( 0x80 )


//--------------------------------------------------
// Constants for VelTimer user defined values
//--------------------------------------------------

#define VelTimer_PERIOD                        ( 0x7fffffff )
#define VelTimer_COMPARE_VALUE                 ( 0x0 )


//-------------------------------------------------
// Register Addresses for VelTimer
//-------------------------------------------------

#pragma ioport  VelTimer_COUNTER_LSB_REG:   0x050          //Count register LSB
BYTE            VelTimer_COUNTER_LSB_REG;
#pragma ioport  VelTimer_COUNTER_ISB1_REG:  0x054          //Count register ISB1
BYTE            VelTimer_COUNTER_ISB1_REG;
#pragma ioport  VelTimer_COUNTER_ISB2_REG:  0x058          //Count register ISB2
BYTE            VelTimer_COUNTER_ISB2_REG;
#pragma ioport  VelTimer_COUNTER_MSB_REG:   0x05c          //Count register MSB
BYTE            VelTimer_COUNTER_MSB_REG;
#pragma ioport  VelTimer_PERIOD_LSB_REG:    0x051          //Period register LSB
BYTE            VelTimer_PERIOD_LSB_REG;
#pragma ioport  VelTimer_PERIOD_ISB1_REG:   0x055          //Period register ISB1
BYTE            VelTimer_PERIOD_ISB1_REG;
#pragma ioport  VelTimer_PERIOD_ISB2_REG:   0x059          //Period register ISB2
BYTE            VelTimer_PERIOD_ISB2_REG;
#pragma ioport  VelTimer_PERIOD_MSB_REG:    0x05d          //Period register MSB
BYTE            VelTimer_PERIOD_MSB_REG;
#pragma ioport  VelTimer_COMPARE_LSB_REG:   0x052          //Compare register LSB
BYTE            VelTimer_COMPARE_LSB_REG;
#pragma ioport  VelTimer_COMPARE_ISB1_REG:  0x056          //Compare register ISB1
BYTE            VelTimer_COMPARE_ISB1_REG;
#pragma ioport  VelTimer_COMPARE_ISB2_REG:  0x05a          //Compare register ISB2
BYTE            VelTimer_COMPARE_ISB2_REG;
#pragma ioport  VelTimer_COMPARE_MSB_REG:   0x05e          //Compare register MSB
BYTE            VelTimer_COMPARE_MSB_REG;
#pragma ioport  VelTimer_CONTROL_LSB_REG:   0x053          //Control register LSB
BYTE            VelTimer_CONTROL_LSB_REG;
#pragma ioport  VelTimer_CONTROL_ISB1_REG:  0x057          //Control register ISB1
BYTE            VelTimer_CONTROL_ISB1_REG;
#pragma ioport  VelTimer_CONTROL_ISB2_REG:  0x05b          //Control register ISB2
BYTE            VelTimer_CONTROL_ISB2_REG;
#pragma ioport  VelTimer_CONTROL_MSB_REG:   0x05f          //Control register MSB
BYTE            VelTimer_CONTROL_MSB_REG;
#pragma ioport  VelTimer_FUNC_LSB_REG:  0x150              //Function register LSB
BYTE            VelTimer_FUNC_LSB_REG;
#pragma ioport  VelTimer_FUNC_ISB1_REG: 0x154              //Function register ISB1
BYTE            VelTimer_FUNC_ISB1_REG;
#pragma ioport  VelTimer_FUNC_ISB2_REG: 0x158              //Function register ISB2
BYTE            VelTimer_FUNC_ISB2_REG;
#pragma ioport  VelTimer_FUNC_MSB_REG:  0x15c              //Function register MSB
BYTE            VelTimer_FUNC_MSB_REG;
#pragma ioport  VelTimer_INPUT_LSB_REG: 0x151              //Input register LSB
BYTE            VelTimer_INPUT_LSB_REG;
#pragma ioport  VelTimer_INPUT_ISB1_REG:    0x155          //Input register ISB1
BYTE            VelTimer_INPUT_ISB1_REG;
#pragma ioport  VelTimer_INPUT_ISB2_REG:    0x159          //Input register ISB2
BYTE            VelTimer_INPUT_ISB2_REG;
#pragma ioport  VelTimer_INPUT_MSB_REG: 0x15d              //Input register MSB
BYTE            VelTimer_INPUT_MSB_REG;
#pragma ioport  VelTimer_OUTPUT_LSB_REG:    0x152          //Output register LSB
BYTE            VelTimer_OUTPUT_LSB_REG;
#pragma ioport  VelTimer_OUTPUT_ISB1_REG:   0x156          //Output register ISB1
BYTE            VelTimer_OUTPUT_ISB1_REG;
#pragma ioport  VelTimer_OUTPUT_ISB2_REG:   0x15a          //Output register ISB2
BYTE            VelTimer_OUTPUT_ISB2_REG;
#pragma ioport  VelTimer_OUTPUT_MSB_REG:    0x15e          //Output register MSB
BYTE            VelTimer_OUTPUT_MSB_REG;
#pragma ioport  VelTimer_INT_REG:       0x0df              //Interrupt Mask Register
BYTE            VelTimer_INT_REG;


//-------------------------------------------------
// VelTimer Macro 'Functions'
//-------------------------------------------------

#define VelTimer_Start_M \
   ( VelTimer_CONTROL_LSB_REG |=  VelTimer_CONTROL_REG_START_BIT )

#define VelTimer_Stop_M  \
   ( VelTimer_CONTROL_LSB_REG &= ~VelTimer_CONTROL_REG_START_BIT )

#define VelTimer_EnableInt_M   \
   M8C_EnableIntMask(  VelTimer_INT_REG, VelTimer_INT_MASK )

#define VelTimer_DisableInt_M  \
   M8C_DisableIntMask( VelTimer_INT_REG, VelTimer_INT_MASK )

#endif
// end of file VelTimer.h
