/**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Table of commands^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

MAV 	 		'a' //Move at velocity
MOV_0 	 		'b' //move m0 at duty cycle
MOV_1 	 		'c' //move m1 at duty cycle
SRV0_POS 	 	'd' //set servo positions for servo 0 (starts PWM)
SRV1_POS 	 	'e' //set servo positions for servo 1 (starts PWM)
SRV0_STP 		'f' //Turns a servo 0 off (stops PWM)
SRV1_STP 		'g' //Turns a servo 1 off (stops PWM)
GETC1	 		'h' //get encoder1 count
GETC2	 		'i' //get encoder2 count
RSTC1	 		'j' //reset encoder1 count
RSTC2	 		'k' //reset encoder2 count
STOP			'l' //stop motors
FORWARD_0		'm' //sets drive mode of m0 to forward
FORWARD_1		'M' //sets drive mode to m1 forward
BACKWARD_0		'n' //sets drive mode to m0 backward
BACKWARD_1		'N' //sets drive mode to m1 backward
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

INPUT		1A		2A		1B		2B
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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Light Sensor^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
MISC1		P0[5]

This is connected to an LDR voltage divider that feeds a programmable gain amplifier. This PGA is used as the
input to an ADC that samples the voltage. Once the voltage is below the threshold we can start the robot.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Line Following^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
MISC3		P0[0]
MISC5		P0[5]

When over the white the reflective sensors output +5V (logic high) and over black they put out ~0V (logic low).
Using this we can determine if we are on the line or not and take corrective measures to keep the robot on the
line.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^HC SR-04^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
MISC4		P0[2] 

Trigger and echo are tied to this pin. Pinmode is set as output and driven high to start the pulse and then
reset to input to wait for the echo. A timer interrupt will trigger that will be used to determine the size
of the pulse and get the distance to an object.
*/

#include <stdlib.h>
#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#pragma interrupt_handler encoder1_ISR
#pragma interrupt_handler encoder2_ISR
#pragma interrupt_handler distance_ISR

const BYTE	debug_mask	=	MISC7_MASK | MISC8_MASK;
const char 	TERM		=	0x07;

const double tick_time = 0.000000020833333333;
const double encoder_res = 0.0357142857142857;

BOOL command_flag 		=	FALSE;
BOOL debug				=	FALSE;
BOOL encoder1_last_changed = FALSE;
BOOL encoder2_last_changed = FALSE;

int i = 0; //loop var

BYTE curPrt1;
BYTE prevPrt1;
BYTE curPrt2;
BYTE prevPrt2;

signed long int count1 = 0;
signed long int count2 = 0;

unsigned long pulse = 0;

int stop = 0;
char ack[4] = "ack";

void init(void);
void waitLDR(void);
void lineFollow(void);
unsigned int ultrasound(void);
void action(char command, char* param);

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
	//enable the positive edge and falling edge paramers
	ENC1A_PEDGE_Start();
	ENC1B_PEDGE_Start();
	ENC1A_NEDGE_Start();
	ENC1B_NEDGE_Start();
	
	UltrasonicInt_Start();
	
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
	
	//start light sensor PGA and ADC.
	LDR_Gain_Start(LDR_Gain_HIGHPOWER);
	LDR_ADC_Start(LDR_ADC_HIGHPOWER);
	
	//enable appropriate interrupts
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB00);
	M8C_EnableIntMask(INT_MSK1, INT_MSK1_DBB11);
	M8C_EnableIntMask(INT_MSK2, INT_MSK2_DCB32);
	M8C_EnableGInt;
	
	UART_PutCRLF();
	UART_CPutString("KIPR bots roll out!");
	UART_PutCRLF();	
	
	waitLDR();
	LDR_Gain_Stop();
	LDR_ADC_Stop();
}

void waitLDR(void)
{
	int threshold = 26; //threshold for startup.
	//int vcount = 0; //voltage counter
	int vcount = LDR_ADC_cGetSample(); //voltage counter
	
	while(vcount > threshold) //keep sampling until threshold is hit.
	{
		vcount = LDR_ADC_cGetSample();
	}
	UART_CPutString("on");
}

void lineFollow(void)
{
	//todo
	/*
	if(left is off and right is on)
	{
		if(center is on and forward)
		{
			// turn clock wise
		}else
		{
			// turn counter clock wise
		}
	}else if(right is on and left is off)
	{
		if (center is on and forward)
		{
			// turn counter clock wise
		}else
		{
			// turn clock wise
		}
	}else
	{
		// Neither is on black...
		if(center is on and forward)
		{
			// drive straight backward
		}else if(center is on and backward)
		{
			// drive straight backward
		}else
		{
			// spin ?
		}
	}
	*/
}

unsigned int ultrasound(void)
{
	unsigned int distance = 0;
	unsigned int ticks = 0xffff;
	
	//We need a 10us high trigger to make a pulse
	//Set timer to 10us period.
	UltraSonic_WritePeriod(1);
	UltraSonic_WriteCompareValue(0);
	
	//set drive mode to Strong (output) to drive trigger high.
	MISC4_DriveMode_0_ADDR |= MISC4_MASK;
	MISC4_DriveMode_1_ADDR &= ~MISC4_MASK;
	MISC4_DriveMode_2_ADDR &= ~MISC4_MASK;
	
	//make tirgger high to start the pulse
	MISC4_Data_ADDR |= MISC4_MASK;
	
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("Ultrasonic is high");
	}
	
	//Start timer to allow for a 10us pulse.
	UltraSonic_Start();
	while(ticks > 0){ticks = UltraSonic_wReadTimer();}
	UltraSonic_Stop();
	
	//set drive mode to HIGH-Z (digital input) to read echo
	MISC4_DriveMode_0_ADDR &= ~MISC4_MASK;
	MISC4_DriveMode_1_ADDR |= MISC4_MASK;
	MISC4_DriveMode_2_ADDR &= ~MISC4_MASK;
	
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("Ultrasonic is low");
	}
	
	//Set period to max so we can determine extctly how long the
	//echo was.
	UltraSonic_WritePeriod(0xffff);
	UltraSonic_WriteCompareValue(0);
	UltrasonicInt_EnableInt();
	UltraSonic_Start();
	
	//distance ISR sets period to 0 upon exiting
	while(UltraSonic_PERIOD > 0);
	UltraSonic_Stop();
	UltrasonicInt_DisableInt();
	
	//distance in cm = us/58
	//clock source is 2 Mhz (0.5 us) so multiply pulse ticks by two
	distance = pulse*0.0345;
	
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("PULSE ");
		UART_PutSHexInt(pulse);
		UART_PutCRLF();
	}
	
	return distance;
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
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			break;
		case 'b': //MOV_0
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting m0 PWM duty cycle to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			PWMA_WritePulseWidth(atoi(param));
			break;
		case 'c': //MOV_1
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting m1 PWM duty cycle to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			PWMB_WritePulseWidth(atoi(param));
			break;
		/*case 'c': //GETV
			*param = 0;
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString(itoa(param, getVelocity(), 10));
				UART_PutCRLF();
			}
			else 
			{
				UART_CPutString(itoa(param, getVelocity(), 10));
			}
			break;*/
		case 'd': //SRV0_POS
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting servo 0 pulse width to: ");
				UART_PutSHexInt(atoi(param));
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
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
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			Servo1_WritePulseWidth(atoi(param));
			break;
		case 'f': //SRV0_STP
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping PWM for servo 0.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			Servo0_WritePulseWidth(0);
			break;
		case 'g': //SRV1_STP
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping PWM for servo 1.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			Servo1_WritePulseWidth(0);
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
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			count1 = 0;
			break;
		case 'k': //RSTC2
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Resetting count2");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			count2 = 0;
			break;
		case 'l': //STOP
			if(debug)
			{
				UART_PutCRLF();
				UART_CPutString("Stopping motors");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			AIN1_Data_ADDR &= ~AIN1_MASK;
			AIN2_Data_ADDR &= ~AIN2_MASK;
			
			PWMA_WritePulseWidth(0);
			PWMB_WritePulseWidth(0);
			//PWMA_Stop();
			//PWMB_Stop();
			break;
		case 'm': //FORWARD_0
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode of m0 to forward.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			AIN1_Data_ADDR |= AIN1_MASK;
			AIN2_Data_ADDR &= ~AIN2_MASK;
			break;
		case 'M': //FORWARD_1
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode of m1 to forward.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			BIN1_Data_ADDR |= BIN1_MASK;
			BIN2_Data_ADDR &= ~BIN2_MASK;
			break;
		case 'n': //BACKWARD_0
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode of m0 to backward.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			AIN1_Data_ADDR &= ~AIN1_MASK;
			AIN2_Data_ADDR |= AIN2_MASK;
			break;
		case 'N': //BACKWARD_1
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode of m1 to backward.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			BIN1_Data_ADDR &= ~BIN1_MASK;
			BIN2_Data_ADDR |= BIN2_MASK;
			break;
		case 'o': //TURNL
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Setting drive mode to left.");
				UART_PutCRLF();
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
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
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			AIN1_Data_ADDR &= ~AIN1_MASK;
			AIN2_Data_ADDR |= AIN2_MASK;
			BIN1_Data_ADDR |= BIN1_MASK;
			BIN2_Data_ADDR &= ~BIN2_MASK;
			break;
		case 'q': //debug
			debug = !debug;
			UART_PutCRLF();
			UART_PutSHexInt(debug);
			UART_PutCRLF();
			break;
		case 'r'://ultrasound
			if (debug)
			{
				UART_PutCRLF();
				UART_CPutString("Starting ultrasonic ping");
				UART_PutCRLF();
				UART_CPutString("Distance: ");
			}
			UART_PutCRLF();
			UART_CPutString("ack");
			UART_PutCRLF();
			itoa(param, ultrasound(), 10);
			UART_PutString(param);
			
			if (debug)
			{
				UART_CPutString(" cm");
				UART_PutCRLF();
			}
			break;
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
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("prevPrt1: ");
		UART_PutSHexInt(prevPrt1);
	}
	
	if ((prevPrt1 & ENC1A_MASK) != (curPrt1 & ENC1A_MASK))
	{
		if (encoder1_last_changed == TRUE)
		{
			if (debug)
			{
				UART_CPutString("noise on A");
				//UART_PutCRLF();
			}
			return ;
		}else 
		{
			encoder1_last_changed = TRUE;
		}
	}else if ((prevPrt1 & ENC1B_MASK) != (curPrt1 & ENC1B_MASK))
	{
		if (encoder1_last_changed == FALSE)
		{
			if (debug)
			{
				UART_CPutString("noise on ");
				//UART_PutCRLF();
			}
			return;
		}else
		{
			encoder1_last_changed = FALSE;
		}
	}
		
	//check which state transitioned.
	if ((prevPrt1 == 0x00) && (curPrt1 == ENC1A_MASK)) //A low to high
	{
		if (debug)
		{
			UART_CPutString("U prevPrt1=0x00");
			//UART_PutCRLF();
		}
		count1++;
	}
	else if ((prevPrt1 == 0x00) && (curPrt1 == ENC1B_MASK)) //B low to high
	{
		if (debug)
		{
		UART_CPutString("D prevPrt1=0x00");
		//UART_PutCRLF();
		}
		count1--;
	}else if ((prevPrt1 == (ENC1A_MASK | ENC1B_MASK)) && (curPrt1 == ENC1B_MASK))
	{
		if (debug)
		{
			UART_CPutString("U ");
			//UART_PutCRLF();
		}
		count1++;	
	}else if ((prevPrt1 == (ENC1A_MASK | ENC1B_MASK)) && (curPrt1 == ENC1A_MASK))
	{
		if (debug)
		{
		UART_CPutString("D ");
		//UART_PutCRLF();
		}
		count1--;
	}
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("Encoder 1 count: ");
		UART_PutSHexInt(count1);
		UART_PutCRLF();
	}
}

//Encoder 2 interrupts are generated directly by the GPIO interrupt. Logically equivalent
//to the encoder1_ISR
void encoder2_ISR(void)
{
	curPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("prevPrt2: ");
		UART_PutSHexInt(prevPrt1);
	}
	if ((prevPrt2 & ENC2A_MASK) != (curPrt2 & ENC2A_MASK))
	{
		if (encoder2_last_changed == TRUE)
		{
			if (debug)
			{
				UART_CPutString("noise on A");
				//UART_PutCRLF();
			}
			return ;
		}else 
		{
			encoder2_last_changed = TRUE;
		}
	}else if ((prevPrt2 & ENC2B_MASK) != (curPrt2 & ENC2B_MASK))
	{
		if (encoder2_last_changed == FALSE)
		{
			if (debug)
			{
				UART_CPutString("noise on ");
				//UART_PutCRLF();
			}
			return;
		}else
		{
			encoder2_last_changed = FALSE;
		}
	}
	
	if ((prevPrt2 == 0x00) && (curPrt2 == ENC2A_MASK))	
	{
		if (debug)
		{
			UART_CPutString("U prevPrt2=0x00");
			//UART_PutCRLF();
		}
		count2++;
	}
	else if ((prevPrt2 == 0x00) && (curPrt2 == ENC2B_MASK))
	{
		if (debug)
		{
			UART_CPutString("D prevPrt2=0x00");
			//UART_PutCRLF();
		}
		count2--;
	}else if ((prevPrt2 == (ENC2A_MASK | ENC2B_MASK)) && (curPrt2 == ENC2B_MASK))
	{
		if (debug)
		{
			UART_CPutString("U ");
			//UART_PutCRLF();
		}
		count2++;	
	}else if ((prevPrt2 == (ENC2A_MASK | ENC2B_MASK)) && (curPrt2 == ENC2A_MASK))
	{
		if (debug)
		{
		UART_CPutString("D ");
		//UART_PutCRLF();
		}
		count2--;
	}
	
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("Encoder 2 count: ");
		UART_PutSHexInt(count2);
		UART_PutCRLF();
	}
}

void distance_ISR(void)
{
	UART_PutCRLF();
	UART_CPutString("Inside the distance ISR");
	UART_PutCRLF();
	if (debug)
	{
		UART_PutCRLF();
		UART_CPutString("Inside the distance ISR");
		UART_PutCRLF();
	}
	stop = 0;
	pulse = UltraSonic_wReadTimer();
	while(MISC4_Data_ADDR & MISC4_MASK);
	pulse -= stop;
	UltraSonic_WritePeriod(0);
}
