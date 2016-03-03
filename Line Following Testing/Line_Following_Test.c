/********************************************************************  
Drive the Create forward (straight) for 1m at a speed of 250mm/sec 
*********************************************************************/
#define TRUE 1
int main()
{	
  printf("Drive Straight"); // announce the program	
  sleep(1.0); // wait 1 second

  create_connect(); // Open the connection between CBC and Create	
  // As long as the create has not driven 1m
	//beep();
  //while (get_create_distance(0.1) < 1000)
  //{		
    //create_spin_CCW(250);
	/*while(get_create_lbump(0) == 0 && get_create_rbump(0) == 0)
	{
		val = analog10(0);
		printf("analog 0 = %d\n", val);
	}*/
  //}
	int ana0 = 0, ana1 = 0;
	create_full();
	while(get_create_lbump(0) == 0 && get_create_rbump(0) == 0){
		ana0 = analog10(0);
		ana1 = analog10(1);
		
		printf("analog 0: %d\n", ana0);
		printf("analog 1: %d\n", ana1);
		if((ana0 < 200) && (ana1 > 200))
		{
			create_spin_CW(128);
		}else if((ana1 < 200) && (ana0 > 200))
		{
			create_spin_CCW(128);
		}else if((ana0 < 200) && (ana1 < 200))
		{
			create_drive_straight(180);
		}
		
	}
  create_stop(); // Stop the Create
  create_disconnect(); // Disconnect the Create
}
