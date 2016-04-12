/**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Table of commands^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

MAV 	 		'a'; //Move at velocity
MOV 	 		'b'; //move at duty cycle
GETV 	 		'c'; //get velocity
SRV0_POS 	 	'd'; //set servo positions for servo 0
SRV1_POS 	 	'e'; // ' ' ' ' ' ' ' ' ' ' ' ' ' '  1
SRV2_POS 		'f'; // ' ' ' ' ' ' ' ' ' ' ' ' ' '  2
SRV3_POS 		'g'; // ' ' ' ' ' ' ' ' ' ' ' ' ' '  3
GETC1	 		'h'; //get encoder1 count
GETC2	 		'i'; //get encoder2 count
RSTC1	 		'j'; //reset encoder1 count
RSTC2	 		'k'; //reset encoder2 count
STOP			'l'; //stop motors

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
==============================================================================================================
==============================================================================================================
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Serial Limitations^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Baude rate			115200
Buffer size			16 bytes

Theoretically 115200 bytes can be sent in one second, at minimum, and 115216 at maximum before buffer overflow.
*/

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include <stdlib.h>

#pragma interrupt_handler encoder1_ISR
#pragma interrupt_handler encoder2_ISR

#define 	stateA1 		0x20
#define 	stateB1 		0x08
#define 	stateA2 		0x10
#define 	stateB2 		0x04

const char 	TEMRM		=	0x07;

BOOL command_flag 		=	FALSE;


int i = 0; //loop var

BYTE curPrt1;
BYTE prevPrt1;
BYTE curPrt2;
BYTE prevPrt2;

signed long int count1 = 0;
signed long int count2 = 0;

void action(char command, char* param, BOOL debug);
int getVelocity(void);

void main(void)
{
	char command;
	char* param;
	char data;
	
	//enable the positive edge and falling edge paramers
	ENC1A_PEDGE_Start();
	ENC1B_PEDGE_Start();
	ENC1A_FEDGE_Start();
	ENC1B_FEDGE_Start();
	
	//enable the falling edge and positive edge interrupts for Encoder 1
	ENC1A_PEDGE_EnableInt();
	ENC1B_PEDGE_EnableInt();
	ENC1A_FEDGE_EnableInt();
	ENC1B_FEDGE_EnableInt();
	
	//Start motor speed PWMs
	PWMA_Start();
	PWMB_Start();
	
	//Start servos
	ServoA_Start();
	
	//start the UART
	//UART_CmdReset();  // Reset command paramer  
	//UART_IntCntl(UART_ENABLE_RX_INT);
	UART_Start(UART_PARITY_NONE);
	//UART_EnableInt();
	
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB00);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB11);
	M8C_EnableGInt ;
	
	UART_PutCRLF();
	UART_CPutString("KIPR bots roll out!");
	UART_PutCRLF();
	
	while(1)
	{
		prevPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
		prevPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));
		
		data = UART_cReadChar();
		
		if (!command_flag && data)
		{
			UART_PutChar(data);
			command_flag = TRUE;
			command = data;
			data = '\0';
		}
		if (data && command_flag)
		{
			if (data == TEMRM)
			{
				command_flag = FALSE;
				param[i] = '\0';
				action(command, param, 1);
				i = 0;
			}
			else 
			{
				param[i] = data;
				UART_PutChar(data);
				i++;
			}
		}
	}
}

int getVelocity(void)
{
	return 0;	
}

void action(char command, char* param, BOOL debug)
{	
	if(debug)
	{
		UART_PutCRLF();
		UART_CPutString("Command: ");
		UART_PutChar(command);
		UART_PutCRLF();
		UART_CPutString("Param: ");
		UART_PutString(param);
		UART_PutCRLF();
	}
	
	switch (command)
	{
		case 'a':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting velocity to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			break;
		case 'b':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting PWM duty cycle to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			break;
		case 'c':
			*param = 0;
			UART_PutCRLF();
			UART_PutString(itoa(param, getVelocity(), 10));
			UART_PutCRLF();
			break;
		case 'd':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 0 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			ServoA_WritePulseWidth(atoi(param));
			
			break;
		case 'e':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 1 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			break;
		case 'f':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 2 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			break;
		case 'g':
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 3 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			break;
		case 'h':
			UART_PutCRLF();
			UART_PutSHexInt(count1);
			UART_PutCRLF();
			break;
		case 'i':
			UART_PutCRLF();
			UART_PutSHexInt(count2);
			UART_PutCRLF();
			break;
		case 'j':
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Resetting count1");
				UART_PutCRLF();
				count1 = 0;
			}
			
			count1 = 0;
			break;
		case 'k':
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Resetting count2");
				UART_PutCRLF();
				count2 = 0;
			}
			
			count2 = 0;
			break;
		case 'l':
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping motors");
				UART_PutCRLF();
				PWMA_WritePulseWidth(0);
				PWMB_WritePulseWidth(0);
			}
			
			PWMA_WritePulseWidth(0);
			PWMB_WritePulseWidth(0);
			break;
		default :
			UART_PutCRLF();
			UART_CPutString("fu1337"); //error code
			UART_PutCRLF();
			break;
	}
}

//Encoder 1 interrupts are generated by the falling edge and positive edge paramers.
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

//Encoder 2 interrupts are generated directly by the GPIO interrupt.
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