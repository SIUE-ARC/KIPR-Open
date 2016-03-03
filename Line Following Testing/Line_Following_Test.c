/********************************************************************  
Follow a Line until the Create Front Bumper is pressed 
*********************************************************************/
#define TRUE 1
int main()
{	
  printf("Line Follow."); // announce the program	
  sleep(1.0); // wait 1 second

  create_connect(); // Open the connection between CBC and Create	
  int ana0 = 0, ana1 = 0; // variables to store the results of the analog sensors
	create_full(); // We don't care about safety
	while(get_create_lbump(0) == 0 && get_create_rbump(0) == 0){ //while the bumper is not pressed
		ana0 = analog10(0); // left sensor
		ana1 = analog10(1); // right sensor
		
		printf("analog 0: %d\n", ana0);// print results
		printf("analog 1: %d\n", ana1);
		if((ana0 < 200) && (ana1 > 200)) // if the left sensor is off and right is on black line
		{
			create_spin_CW(128); // spin the create Clock Wise
		}else if((ana1 < 200) && (ana0 > 200)) // else if reversed
		{
			create_spin_CCW(128); // spin Counter Clock Wise
		}else if((ana0 < 200) && (ana1 < 200)) // else neither is on the line
		{
			create_drive_straight(180); // drive straight
		}
		
	}
  create_stop(); // Stop the Create
  create_disconnect(); // Disconnect the Create
}
