//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#pragma interrupt_handler encoder1_ISR
#pragma interrupt_handler encoder2_ISR

#define stateA1 0x40
#define stateB1 0x10
#define stateA2 0x20
#define stateB2 0x08

BYTE curPrt1;
BYTE prevPrt1;
BYTE curPrt2;
BYTE prevPrt2;

signed long int count1 = 0;
signed long int count2 = 0;

void main(void)
{
	M8C_EnableGInt ;
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB00);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB11);
	
	ENC1A_BUF_EnableInt();
	ENC1B_BUF_EnableInt();
	ENC1A_BUF_Start();
	ENC1B_BUF_Start();
	
	while(1)
	{
		prevPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
		prevPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));
	}
}

void encoder1_ISR(void)
{
	curPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
		
	if ((prevPrt1 == 0x00) && (curPrt1 == stateA1))
	{
		count1++;
	}
	else if ((prevPrt1 == 0x00) && (curPrt1 == stateB1))
	{
		count1--;
	}
}


void encoder2_ISR(void)
{
	curPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));	
		
	if ((prevPrt2 == 0x00) && (curPrt2 == stateA2))	
	{
		count2++;
	}
	else if ((prevPrt2 == 0x00) && (curPrt2 == stateB2))
	{
		count2--;
	}
}