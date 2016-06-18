/**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Table of commands^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

MAV 	 		'a' //Move at velocity
MOV 	 		'b' //move at duty cycle
GETV 	 		'c' //get velocity
SRV0_POS 	 	'd' //set servo positions for servo 0 (starts PWM)
SRV1_POS 	 	'e' //set servo positions for servo 1 (starts PWM)
SRV0_STP 		'f' //Turns a servo 0 off (stops PWM)
SRV1_STP 		'g' //Turns a servo 1 off (stops PWM)
GETC1	 		'h' //get encoder1 count
GETC2	 		'i' //get encoder2 count
RSTC1	 		'j' //reset encoder1 count
RSTC2	 		'k' //reset encoder2 count
STOP			'l' //stop motors
FORWARD			'm' //sets drive mode to forward
BACKWARD		'n' //sets drive mode to backward
TURNL			'o' //sets drive mode to left turn
TURNR			'p' //sets drive mode to right turn

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Serial Limitations^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Baude rate			115200
RX Buffer size		16 bytes

UART RX 			P2[7]
UART TX				P0[1]

* Theoretically 115200 bytes can be sent in one second, at minimum, and 115216 at maximum before buffer overflow.

* All UART commands have either one or zero parameters. All commands must be terminated with an ACII BEL (0x07).
  Command parameters may be space delimited from the command or can be sent as just a single string. 

Examples:

"a25" - move at velcoity 25 RPM.
"a 25" - move at velocity 25 RPM

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Servo Information^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Servo0		P0[3] (MISC0)
Servo1		P0[7] (MISC2)

16 bit resoltion for each. Every tick = 1 us.

Servo accepts PWM range from ~700 us to ~2200 us for a 180* servo.

RPi will convert servo angle to pulse width and send to PSoC. Then the servo angle will be set by writing the
Pulse width to the PWM register.

**NOTE**
Higer resolution can be achieved by using a faster clock and allowing for more ticks but 1 Mhz clock 1 us tick
makes calculations a little easier.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Drive Modes^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The motor driver must be configured for each of our drive modes. The drive modes are defined as follows:

INPUT		1A		1B		2A		2B
=======================================
Forward		1		0		1		0
Backward	0		1		0		1
Left		1		0		0		1
Right		0		1		1		0

In general for one motor

INPUT		A		B
======================
Drift		1		1 	(causes robot to coast)
CCW			0		1
CW			1		0
Stop		0		0

If STDBY is asserted (ie. pulled LOW) then all modes are treated as STOP.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Debug Mode^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A debug mode is provided for getting serial print statements to indicate useful data when passing commands
to the PSoC. To enable this mode assert MISC7 and MISC8 as high at power on. (ie, connect MISC7 and MISC8
to VCC before powering on).

After the init() function is called their states will be read and a flag will be set according to those states.
If debug mode is not desired merely leave those pins floating.

MISC7		P1[2]
MISC8		P1[3]

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Light Sensor^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
MISC1		P0[5]

*/

#include <stdlib.h>
#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#pragma interrupt_handler encoder1_ISR
#pragma interrupt_handler encoder2_ISR

#define 	stateA1 		0x20
#define 	stateB1 		0x08
#define 	stateA2 		0x10
#define 	stateB2 		0x04

const BYTE	debug_mask	=	MISC7_MASK | MISC8_MASK;
const char 	TERM		=	0x07;

const double tick_time = 0.0000000208333333;
const double encoder_res = 0.0357142857142857;

BOOL command_flag 		=	FALSE;
BOOL debug				=	FALSE;

int i = 0; //loop var

BYTE curPrt1;
BYTE prevPrt1;
BYTE curPrt2;
BYTE prevPrt2;

signed long int count1 = 0;
signed long int count2 = 0;

void init(void);
void action(char command, char* param);
double getVelocity(void);

void main(void)
{
	char command;
	char* param;
	char data;
	
	init();
	
	while(1)
	{
		//read the state of encoders. this will be needed if we interrupt.
		prevPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
		prevPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));
		
		data = UART_cReadChar(); //check for data
		
		if (!command_flag && data) //no command has been read and data is valid (not null)
		{
			if (debug)
				UART_PutChar(data);
			
			command_flag = TRUE;
			command = data;
			data = '\0';
		}
		if (data && command_flag)//command byte read and data is valid (not null)
		{
			if (data == TERM) //command terminator read
			{
				command_flag = FALSE;
				param[i] = '\0'; //null terminate parameter string
				action(command, param);
				i = 0; //reset counter
			}
			else //read parameter byte 
			{
				if (debug)
					UART_PutChar(data);
				
				param[i] = data;
				i++;
			}
		}
	}
}

void init(void)
{
	BYTE debug_conf;
	BYTE misc8_start[3], misc7_start[3];
	
	//enable the positive edge and falling edge paramers
	ENC1A_PEDGE_Start();
	ENC1B_PEDGE_Start();
	ENC1A_NEDGE_Start();
	ENC1B_NEDGE_Start();
	
	//enable the falling edge and positive edge interrupts for Encoder 1
	ENC1A_PEDGE_EnableInt();
	ENC1B_PEDGE_EnableInt();
	ENC1A_NEDGE_EnableInt();
	ENC1B_NEDGE_EnableInt();
	
	//Start motor speed PWMs
	PWMA_Start();
	PWMB_Start();
	
	//Start servos
	Servo0_Start();
	Servo1_Start();
	
	//start the UART
	UART_Start(UART_PARITY_NONE);
	
	//start the Velocity Timer
	VelTimer_Start();
	
	//enable appropriate interrupts
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB00);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB11);
	M8C_EnableGInt;
	
	UART_PutCRLF();
	UART_CPutString("KIPR bots roll out!");
	UART_PutCRLF();	
	debug = TRUE;
		
	//clear drive mode settings for MISC7
	/*MISC7_DriveMode_0_ADDR &= ~MISC7_MASK;
	MISC7_DriveMode_1_ADDR &= ~MISC7_MASK;
	MISC7_DriveMode_2_ADDR &= ~MISC7_MASK;
	
	//clear drive mode settings for MISC8
	MISC8_DriveMode_0_ADDR &= ~MISC8_MASK;
	MISC8_DriveMode_1_ADDR &= ~MISC8_MASK;
	MISC8_DriveMode_2_ADDR &= ~MISC8_MASK;
	
	//now that their settings are cleared set their mode to
	//HIGH-Z to use them as debug point inputs.
	MISC7_DriveMode_1_ADDR |= MISC7_MASK;
	
	MISC8_DriveMode_1_ADDR |= MISC8_MASK;
	
	//wait for drive modes to change.
	for(i = 0; i < 1000; i++);
	
	//read the debug inputs, if they are high then they are
	//being purposefully asserted to enter debug mode.
	debug_conf &= ((MISC7_Data_ADDR & MISC7_MASK) | (MISC8_Data_ADDR & MISC8_MASK));
	
	if (debug_conf == debug_mask)
		debug = TRUE;
	
	//afterwards reset MISC pins to their intended state
	misc7_start[0] = MISC7_DriveMode_0_ADDR;
	misc7_start[1] = MISC7_DriveMode_1_ADDR;
	misc7_start[2] = MISC7_DriveMode_2_ADDR;
	
	MISC7_DriveMode_0_ADDR &= ~MISC7_MASK;
	MISC7_DriveMode_1_ADDR &= ~MISC7_MASK;
	MISC7_DriveMode_2_ADDR &= ~MISC7_MASK;
	
	misc8_start[0] = MISC8_DriveMode_0_ADDR;
	misc8_start[1] = MISC8_DriveMode_1_ADDR;
	misc8_start[2] = MISC8_DriveMode_2_ADDR;
	
	MISC8_DriveMode_0_ADDR &= ~MISC8_MASK;
	MISC8_DriveMode_1_ADDR &= ~MISC8_MASK;
	MISC8_DriveMode_2_ADDR &= ~MISC8_MASK;
	
	//set MISC7 and MISC8 to original pin mux state
	MISC7_DriveMode_2_ADDR |= misc7_start[2];
	MISC7_DriveMode_1_ADDR |= misc7_start[1];
	MISC7_DriveMode_0_ADDR |= misc7_start[0];
	
	MISC8_DriveMode_2_ADDR |= misc8_start[2];
	MISC8_DriveMode_1_ADDR |= misc8_start[1];
	MISC8_DriveMode_0_ADDR |= misc8_start[0];*/
}

/* Calculates the velocity in RPMs and returns the value */
double getVelocity(void)
{
	double vel = 0;
	DWORD* endTicks; //ending value of counter
	DWORD* initTicks; //initial counter reg value
	DWORD ticksDone = 14; //number of ticks til done looping
	DWORD diff = 0; //difference between current count reg and 
	signed long initCount = 0;
	
	VelTimer_ReadTimer(initTicks); //read the counter
	initCount = count1;
	
	//keep reading the value until the difference between first and current is large enough
	do 
	{
		diff = abs(abs(count1) - abs(initCount));
	}
	while(diff > ticksDone);
	
	VelTimer_ReadTimer(endTicks);
	
	vel = encoder_res*diff/(abs(*initTicks - *endTicks)*tick_time);
	
	return vel;	
}

/* Action lookup. Takes the appropriate action for the given command and param.
 * command: the command read from the UART.
 * param: the data (if any) associated with the command.
 */
void action(char command, char* param)
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
		case 'a': //MAV
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting velocity to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			break;
		case 'b': //MOV
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting PWM duty cycle to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			PWMA_WritePulseWidth(atoi(param));
			PWMB_WritePulseWidth(atoi(param));
			break;
		case 'c': //GETV
			*param = 0;
			if (debug)
			{
				UART_PutCRLF();
				UART_PutString(itoa(param, getVelocity(), 10));
				UART_PutCRLF();
			}
			else 
			{
				UART_PutString(itoa(param, getVelocity(), 10));
			}
			break;
		case 'd': //SRV0_POS
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 0 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			if ((Servo0_CONTROL_LSB_REG & Servo0_CONTROL_REG_START_BIT) == 0x00) //servo has not been started
				Servo0_Start();
			
			Servo0_WritePulseWidth(atoi(param));
			break;
		case 'e': //SRV1_POS
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 1 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			
			if ((Servo1_CONTROL_LSB_REG & Servo1_CONTROL_REG_START_BIT) == 0x00) //servo has not been started
				Servo1_Start();
			
			Servo1_WritePulseWidth(atoi(param));
			break;
		case 'f': //SRV0_STP
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping PWM for servo 0.");
				UART_PutCRLF();
			}
			
			Servo0_Stop();;
			break;
		case 'g': //SRV1_STP
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping PWM for servo 1.");
				UART_PutCRLF();
			}
			
			Servo1_Stop();
			break;
		case 'h': //GETC1
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Encoder 1 count: ");
			}
			
			UART_PutSHexInt(count1);
			
			if (debug)
				UART_PutCRLF();
			break;
		case 'i': //GETC2
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Encoder 2 count: ");
			}
			UART_PutSHexInt(count2);
			
			if(debug)
				UART_PutCRLF();
			break;
		case 'j': //RSTC1
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Resetting count1");
				UART_PutCRLF();
			}
			
			count1 = 0;
			break;
		case 'k': //RSTC2
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Resetting count2");
				UART_PutCRLF();
			}
			
			count2 = 0;
			break;
		case 'l': //STOP
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping motors");
				UART_PutCRLF();
			}
			
			PWMA_WritePulseWidth(0);
			PWMB_WritePulseWidth(0);
			PWMA_Stop();
			PWMB_Stop();
			break;
		case 'm': //FORWARD
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode to forward.");
				UART_PutCRLF();
			}
			
			AIN1_Data_ADDR |= AIN1_MASK;
			AIN2_Data_ADDR |= AIN2_MASK;
			BIN1_Data_ADDR &= ~BIN1_MASK;
			BIN2_Data_ADDR &= ~BIN2_MASK;
			break;
		case 'n': //BACKWARD
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode to backward.");
				UART_PutCRLF();
			}
			
			AIN1_Data_ADDR &= ~AIN1_MASK;
			AIN2_Data_ADDR &= ~AIN2_MASK;
			BIN1_Data_ADDR |= BIN1_MASK;
			BIN2_Data_ADDR |= BIN2_MASK;
			break;
		case 'o': //TURNL
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode to left.");
				UART_PutCRLF();
			}
			
			AIN1_Data_ADDR |= AIN1_MASK;
			AIN2_Data_ADDR &= ~AIN2_MASK;
			BIN1_Data_ADDR &= ~BIN1_MASK;
			BIN2_Data_ADDR |= BIN2_MASK;
			break;
		case 'p': //TURNR
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode to right.");
				UART_PutCRLF();
			}
			
			AIN1_Data_ADDR &= ~AIN1_MASK;
			AIN2_Data_ADDR |= AIN2_MASK;
			BIN1_Data_ADDR |= BIN1_MASK;
			BIN2_Data_ADDR &= ~BIN2_MASK;
			break;
		case 'q': //debug
			debug = !debug;
		default : //ERROR
			if (debug)
				UART_PutCRLF();
			
			UART_CPutString("fu1337"); //error code
			
			if (debug)
				UART_PutCRLF();
			break;
	}
}

//Encoder 1 interrupts are generated by the falling edge and positive edge paramers.
void encoder1_ISR(void)
{
	//grab the new state of the encoder register.
	curPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
		
	//check which state transitioned.
	if ((prevPrt1 == 0x00) && (curPrt1 == stateA1)) //A low to high
	{
		count1++;
	}
	else if ((prevPrt1 == 0x00) && (curPrt1 == stateB1)) //B low to high
	{
		count1--;
	}
}

//Encoder 2 interrupts are generated directly by the GPIO interrupt. Logically equivalent
//to the encoder1_ISR
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