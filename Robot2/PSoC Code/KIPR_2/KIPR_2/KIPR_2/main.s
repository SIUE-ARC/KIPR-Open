	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.area lit(rom, con, rel, lit)
_debug_mask::
	.byte 12
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.dbsym e debug_mask _debug_mask kc
_TERM::
	.byte 7
	.dbsym e TERM _TERM kc
_tick_time::
	.word 0x32b2,0xf4fc
	.dbsym e tick_time _tick_time kD
_encoder_res::
	.word 0x3d12,0x4925
	.dbsym e encoder_res _encoder_res kD
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_command_flag::
	.byte 0
	.dbsym e command_flag _command_flag c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_debug::
	.byte 1
	.dbsym e debug _debug c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_i::
	.word 0
	.dbsym e i _i I
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_count1::
	.word 0,0
	.dbsym e count1 _count1 L
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_count2::
	.word 0,0
	.dbsym e count2 _count2 L
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.area text(rom, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
	.dbfunc e main _main fV
;          param -> X+2
;        command -> X+1
;           data -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 122
; /**
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Table of commands^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; 
; MAV 	 		'a' //Move at velocity
; MOV_0 	 		'b' //move m0 at duty cycle
; MOV_1 	 		'B' //move m1 at duty cycle
; GETV 	 		'c' //get velocity
; SRV0_POS 	 	'd' //set servo positions for servo 0 (starts PWM)
; SRV1_POS 	 	'e' //set servo positions for servo 1 (starts PWM)
; SRV0_STP 		'f' //Turns a servo 0 off (stops PWM)
; SRV1_STP 		'g' //Turns a servo 1 off (stops PWM)
; GETC1	 		'h' //get encoder1 count
; GETC2	 		'i' //get encoder2 count
; RSTC1	 		'j' //reset encoder1 count
; RSTC2	 		'k' //reset encoder2 count
; STOP			'l' //stop motors
; FORWARD_0		'm' //sets drive mode of m0 to forward
; FORWARD_1		'M' //sets drive mode to m1 forward
; BACKWARD_0		'n' //sets drive mode to m0 backward
; BACKWARD_1		'N' //sets drive mode to m1 backward
; TURNL			'o' //sets drive mode to left turn
; TURNR			'p' //sets drive mode to right turn
; 
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Serial Limitations^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; 
; Baude rate			115200
; RX Buffer size		16 bytes
; 
; UART RX 			P2[7]
; UART TX				P0[1]
; 
; * Theoretically 115200 bytes can be sent in one second, at minimum, and 115216 at maximum before buffer overflow.
; 
; * All UART commands have either one or zero parameters. All commands must be terminated with an ACII BEL (0x07).
;   Command parameters may be space delimited from the command or can be sent as just a single string. 
; 
; Examples:
; 
; "a25" - move at velcoity 25 RPM.
; "a 25" - move at velocity 25 RPM
; 
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Servo Information^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; 
; Servo0		P0[3] (MISC0)
; Servo1		P0[7] (MISC2)
; 
; 16 bit resoltion for each. Every tick = 1 us.
; 
; Servo accepts PWM range from ~700 us to ~2200 us for a 180* servo.
; 
; RPi will convert servo angle to pulse width and send to PSoC. Then the servo angle will be set by writing the
; Pulse width to the PWM register.
; 
; **NOTE**
; Higer resolution can be achieved by using a faster clock and allowing for more ticks but 1 Mhz clock 1 us tick
; makes calculations a little easier.
; 
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Drive Modes^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; 
; The motor driver must be configured for each of our drive modes. The drive modes are defined as follows:
; 
; INPUT		1A		2A		1B		2B
; =======================================
; Forward		1		0		1		0
; Backward	0		1		0		1
; Left		1		0		0		1
; Right		0		1		1		0
; 
; In general for one motor
; 
; INPUT		A		B
; ======================
; Drift		1		1 	(causes robot to coast)
; CCW			0		1
; CW			1		0
; Stop		0		0
; 
; If STDBY is asserted (ie. pulled LOW) then all modes are treated as STOP.
; 
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Light Sensor^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; MISC1		P0[5]
; 
; */
; 
; #include <stdlib.h>
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; 
; #pragma interrupt_handler encoder1_ISR
; #pragma interrupt_handler encoder2_ISR
; 
; const BYTE	debug_mask	=	MISC7_MASK | MISC8_MASK;
; const char 	TERM		=	0x07;
; 
; const double tick_time = 0.000000020833333333;
; const double encoder_res = 0.0357142857142857;
; 
; BOOL command_flag 		=	FALSE;
; BOOL debug				=	TRUE;
; 
; int i = 0; //loop var
; 
; BYTE curPrt1;
; BYTE prevPrt1;
; BYTE curPrt2;
; BYTE prevPrt2;
; 
; signed long int count1 = 0;
; signed long int count2 = 0;
; 
; void init(void);
; void waitLDR(void);
; void action(char command, char* param);
; //double getVelocity(void);
; 
; void main(void)
; {
	.dbline 127
; 	char command;
; 	char* param;
; 	char data;
; 	
; 	init();
	xcall _init
	xjmp L3
L2:
	.dbline 130
; 	
; 	while(1)
; 	{
	.dbline 132
; 		//read the state of encoders. this will be needed if we interrupt.
; 		prevPrt1 = (ENC1A_Data_ADDR & (ENC1A_MASK | ENC1B_MASK));
	mov A,REG[0x8]
	and A,80
	mov REG[0xd0],>_prevPrt1
	mov [_prevPrt1],A
	.dbline 133
; 		prevPrt2 = (ENC2A_Data_ADDR & (ENC2A_MASK | ENC2B_MASK));
	mov A,REG[0x8]
	and A,40
	mov REG[0xd0],>_prevPrt2
	mov [_prevPrt2],A
	.dbline 135
; 		
; 		data = UART_cReadChar(); //check for data
	push X
	xcall _UART_cReadChar
	pop X
	mov [X+0],A
	.dbline 137
; 		
; 		if (!command_flag && data) //no command has been read and data is valid (not null)
	mov REG[0xd0],>_command_flag
	cmp [_command_flag],0
	jnz L5
	cmp [X+0],0
	jz L5
	.dbline 139
; 		{
; 			if (debug)
	.dbline 139
	mov REG[0xd0],>_debug
	cmp [_debug],0
	jz L7
	.dbline 140
; 				UART_PutChar(data);
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
L7:
	.dbline 142
; 			
; 			command_flag = TRUE;
	mov REG[0xd0],>_command_flag
	mov [_command_flag],1
	.dbline 143
; 			command = data;
	mov A,[X+0]
	mov [X+1],A
	.dbline 144
; 			data = '\0';
	mov [X+0],0
	.dbline 145
; 		}
L5:
	.dbline 146
; 		if (data && command_flag)//command byte read and data is valid (not null)
	cmp [X+0],0
	jz L9
	mov REG[0xd0],>_command_flag
	cmp [_command_flag],0
	jz L9
	.dbline 148
; 		{
; 			if (data == TERM) //command terminator read
	.dbline 148
	mov REG[0xd0],>__r0
	mov A,>_TERM
	push X
	mov X,<_TERM
	romx
	pop X
	mov [__r0],A
	mov A,[X+0]
	cmp A,[__r0]
	jnz L11
	.dbline 150
; 			{
; 				command_flag = FALSE;
	.dbline 150
	mov REG[0xd0],>_command_flag
	mov [_command_flag],0
	.dbline 151
; 				param[i] = '\0'; //null terminate parameter string
	mov REG[0xd0],>_i
	mov A,[_i+1]
	add A,[X+3]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_i
	mov A,[_i]
	adc A,[X+2]
	mov REG[0xd0],>__r0
	mov REG[0xd5],A
	mov A,0
	mvi [__r1],A
	.dbline 152
; 				action(command, param);
	mov A,[X+2]
	push A
	mov A,[X+3]
	push A
	mov A,[X+1]
	push A
	xcall _action
	add SP,-3
	.dbline 153
; 				i = 0; //reset counter
	mov REG[0xd0],>_i
	mov [_i+1],0
	mov [_i],0
	.dbline 154
; 			}
	xjmp L12
L11:
	.dbline 156
; 			else //read parameter byte 
; 			{
	.dbline 157
; 				if (debug)
	mov REG[0xd0],>_debug
	cmp [_debug],0
	jz L13
	.dbline 158
; 					UART_PutChar(data);
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
L13:
	.dbline 160
; 				
; 				param[i] = data;
	mov REG[0xd0],>_i
	mov A,[_i+1]
	add A,[X+3]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_i
	mov A,[_i]
	adc A,[X+2]
	mov REG[0xd0],>__r0
	mov REG[0xd5],A
	mov A,[X+0]
	mvi [__r1],A
	.dbline 161
; 				i++;
	mov REG[0xd0],>_i
	inc [_i+1]
	adc [_i],0
	.dbline 162
; 			}
L12:
	.dbline 163
; 		}
L9:
	.dbline 164
; 	}
L3:
	.dbline 129
	xjmp L2
X0:
	.dbline -2
L1:
	add SP,-4
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l param 2 pc
	.dbsym l command 1 c
	.dbsym l data 0 c
	.dbend
	.dbfunc e init _init fV
_init::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e waitLDR _waitLDR fV
_waitLDR::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e action _action fV
;          param -> X-6
;        command -> X-4
_action::
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l param -6 pc
	.dbsym l command -4 c
	.dbend
	.dbfunc e encoder1_ISR _encoder1_ISR fV
_encoder1_ISR::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e encoder2_ISR _encoder2_ISR fV
_encoder2_ISR::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_prevPrt2::
	.byte 0
	.dbsym e prevPrt2 _prevPrt2 c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_curPrt2::
	.byte 0
	.dbsym e curPrt2 _curPrt2 c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_prevPrt1::
	.byte 0
	.dbsym e prevPrt1 _prevPrt1 c
	.area data(ram, con, rel)
	.dbfile C:\Users\BRYANO~1\DOCUME~1\GitHub\KIPR-O~1\Robot2\PSOCCO~1\KIPR_2\KIPR_2\KIPR_2\main.c
_curPrt1::
	.byte 0
	.dbsym e curPrt1 _curPrt1 c
	.area lit(rom, con, rel, lit)
L131:
	.byte 'E,'n,'c,50,32,'c,'o,'u,'n,'t,'i,'n,'g,32,'d,'o
	.byte 'w,'n,0
L128:
	.byte 'E,'n,'c,50,32,'c,'o,'u,'n,'t,'i,'n,'g,32,'u,'p
	.byte 0
L124:
	.byte 'E,'n,'c,49,32,'c,'o,'u,'n,'t,'i,'n,'g,32,'d,'o
	.byte 'w,'n,0
L121:
	.byte 'E,'n,'c,49,32,'c,'o,'u,'n,'t,'i,'n,'g,32,'u,'p
	.byte 0
L114:
	.byte 'f,'u,49,51,51,55,0
L107:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'t,'o,32,'r,'i,'g,'h,'t,46,0
L103:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'t,'o,32,'l,'e,'f,'t,46,0
L99:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'o,'f,32,'m,49,32,'t,'o,32,'b,'a,'c,'k
	.byte 'w,'a,'r,'d,46,0
L95:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'o,'f,32,'m,48,32,'t,'o,32,'b,'a,'c,'k
	.byte 'w,'a,'r,'d,46,0
L91:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'o,'f,32,'m,49,32,'t,'o,32,'f,'o,'r,'w
	.byte 'a,'r,'d,46,0
L87:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'d,'r,'i,'v,'e,32,'m,'o
	.byte 'd,'e,32,'o,'f,32,'m,48,32,'t,'o,32,'f,'o,'r,'w
	.byte 'a,'r,'d,46,0
L83:
	.byte 'S,'t,'o,'p,'p,'i,'n,'g,32,'m,'o,'t,'o,'r,'s,0
L79:
	.byte 'R,'e,'s,'e,'t,'t,'i,'n,'g,32,'c,'o,'u,'n,'t,50
	.byte 0
L75:
	.byte 'R,'e,'s,'e,'t,'t,'i,'n,'g,32,'c,'o,'u,'n,'t,49
	.byte 0
L69:
	.byte 'E,'n,'c,'o,'d,'e,'r,32,50,32,'c,'o,'u,'n,'t,58
	.byte 32,0
L63:
	.byte 'E,'n,'c,'o,'d,'e,'r,32,49,32,'c,'o,'u,'n,'t,58
	.byte 32,0
L59:
	.byte 'S,'t,'o,'p,'p,'i,'n,'g,32,'P,'W,'M,32,'f,'o,'r
	.byte 32,'s,'e,'r,'v,'o,32,49,46,0
L55:
	.byte 'S,'t,'o,'p,'p,'i,'n,'g,32,'P,'W,'M,32,'f,'o,'r
	.byte 32,'s,'e,'r,'v,'o,32,48,46,0
L51:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'s,'e,'r,'v,'o,32,49,32
	.byte 'p,'u,'l,'s,'e,32,'w,'i,'d,'t,'h,32,'t,'o,58,32
	.byte 0
L47:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'s,'e,'r,'v,'o,32,48,32
	.byte 'p,'u,'l,'s,'e,32,'w,'i,'d,'t,'h,32,'t,'o,58,32
	.byte 0
L43:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'m,49,32,'P,'W,'M,32,'d
	.byte 'u,'t,'y,32,'c,'y,'c,'l,'e,32,'t,'o,58,32,0
L39:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'m,48,32,'P,'W,'M,32,'d
	.byte 'u,'t,'y,32,'c,'y,'c,'l,'e,32,'t,'o,58,32,0
L35:
	.byte 'S,'e,'t,'t,'i,'n,'g,32,'v,'e,'l,'o,'c,'i,'t,'y
	.byte 32,'t,'o,58,32,0
L28:
	.byte 'P,'a,'r,'a,'m,58,32,0
L27:
	.byte 'C,'o,'m,'m,'a,'n,'d,58,32,0
L16:
	.byte 'K,'I,'P,'R,32,'b,'o,'t,'s,32,'r,'o,'l,'l,32,'o
	.byte 'u,'t,33,0
