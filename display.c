#define B_E 		0x40 	// Enable
#define B_RST 		0x20 	// Reset
#define B_CS2 		0x10 	// Controller Select 2
#define B_CS1 		8 		// Controller Select 1
#define B_SELECT 	4 		// ASCII or Graphics select
#define B_RW 		2 		// Read/Write
#define B_DI 		1 		// Data or Instruction : 1 data, 0 Instr

#define LCD_ON 			0x3F // Display på
#define LCD_OFF 		0x3E // Av
#define LCD_SET_ADD 	0x40 // Set X adress (0 – 63)
#define LCD_SET_PAGE 	0xB8 // Set Y adress (0 – 7)
#define LCD_DISP_START	0xC0 // Start adress i display minne
#define LCD_BUSY 		0x80 // läsa ut busy status. R/W skall vara hög

// Port E
#define PORT_DISPLAY_BASE 	0x40021000 // MD407 port E
#define portModer 			((volatile unsigned int *) (PORT_DISPLAY_BASE))
#define portOtyper 			((volatile unsigned short *) (PORT_DISPLAY_BASE+0x4))
#define portOspeedr 			((volatile unsigned int *) (PORT_DISPLAY_BASE+0x8))
#define portPupdr 			((volatile unsigned int *) (PORT_DISPLAY_BASE+0xC))
#define portIdr 			((volatile unsigned short *) (PORT_DISPLAY_BASE+0x10))
#define portIdrHigh 			((volatile unsigned char *) (PORT_DISPLAY_BASE+0x11))
#define portOdrLow 			((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14))
#define portOdrHigh 			((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14+1))

void graphic_IO_init(void){
	*portModer = 0x55555555; 	// all bits outputs 
	*portOtyper = 0x00000000; 	// outputs are push/pull 
	*portOspeedr = 0x55555555; // medium speed 
	*portPupdr = 0x55550000; 	// inputs are pull up 
}

static void graphic_ctrl_bit_set( unsigned char x ){
	*portOdrLow |= ( ~B_SELECT & x );
}

static void graphic_ctrl_bit_clear( unsigned char x ){
	*portOdrLow &= ( ~B_SELECT & ~x );
}

static void select_controller(unsigned char controller){
	switch(controller){
		case 0:
			graphic_ctrl_bit_clear(B_CS1|B_CS2);
			break;
		case B_CS1 :
			graphic_ctrl_bit_set(B_CS1); graphic_ctrl_bit_clear(B_CS2);
			break;
		case B_CS2 :
			graphic_ctrl_bit_set(B_CS2); graphic_ctrl_bit_clear(B_CS1);
			break;
		case B_CS1|B_CS2 :
			graphic_ctrl_bit_set(B_CS1|B_CS2);
			break;
	}
}

static void graphic_wait_ready(void)
{
	unsigned char c;
	
	graphic_ctrl_bit_clear( B_E );
	
	// b15-8 are inputs, b7-0 are outputs
	*portModer = 0x00005555;
	
	graphic_ctrl_bit_clear( B_DI );
	graphic_ctrl_bit_set( B_RW );
	delay_500ns();
	delay_500ns();
	while( 1 ){
		graphic_ctrl_bit_set( B_E );
		delay_500ns();
		delay_500ns();
		c = *portIdrHigh & 0x80;
		if( c == 0 )
			break;
			
		graphic_ctrl_bit_clear( B_E );
		delay_500ns();
		delay_500ns();
	}
	
	// all bits outputs
	*portModer = 0x55555555;
	
	graphic_ctrl_bit_set( B_E );
}

static unsigned char display_read(unsigned char controller){
	unsigned char c;
	
	// b15-8 are inputs, 7-0 are outputs
	*portModer = 0x00005555;
	
	select_controller( controller );
	
	graphic_ctrl_bit_clear( B_E );
	graphic_ctrl_bit_set( B_DI | B_RW );
	delay_500ns();
	delay_500ns();
	graphic_ctrl_bit_set( B_E );
	delay_500ns();
	delay_500ns();
	c = *portIdrHigh;
	graphic_ctrl_bit_clear( B_E );
	
	// all bits outputs
	*portModer = 0x55555555;
	
	if( controller & B_CS1 ){
		select_controller( B_CS1);
		graphic_wait_ready();
	}
	
	if( controller & B_CS2 ){
		select_controller( B_CS2);
		graphic_wait_ready();
	}
	
	return c;
}

// Two reads are required
static unsigned char graphic_read(unsigned char controller){
	display_read(controller);
	return display_read(controller);
}

static void graphic_write(unsigned char val, unsigned char controller){
	*portOdrHigh = val;
	
	select_controller( controller );
	delay_500ns();
	//delay_500ns();
	graphic_ctrl_bit_set( B_E );
	delay_500ns();
	//delay_500ns();
	graphic_ctrl_bit_clear( B_E );
	
	if( controller & B_CS1 ){
		select_controller( B_CS1);
		graphic_wait_ready();
	}
	
	if( controller & B_CS2 ){
		select_controller( B_CS2);
		graphic_wait_ready();
	}
	
	*portOdrHigh = 0;
	graphic_ctrl_bit_set( B_E );
	select_controller( 0 );
}

static void graphic_writeCommand(unsigned char commandToWrite, unsigned char controller) {
	graphic_ctrl_bit_clear( B_E );
	graphic_ctrl_bit_clear( B_DI | B_RW );
	graphic_write(commandToWrite, controller);
}

static void graphic_writeData(unsigned char data, unsigned char controller) {
	graphic_ctrl_bit_clear( B_E );
	graphic_ctrl_bit_set( B_DI );
	graphic_ctrl_bit_clear( B_RW );
	graphic_write(data, controller);
}

void graphic_initalize(void) {
	
	graphic_ctrl_bit_set( B_E );
	delay_micro(10);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
	delay_milli( 30 );
	delay_milli( 30 );
	graphic_ctrl_bit_set(B_RST);
	
	graphic_writeCommand(LCD_OFF, B_CS1|B_CS2);
	graphic_writeCommand(LCD_ON, B_CS1|B_CS2);
	graphic_writeCommand(LCD_DISP_START, B_CS1|B_CS2);
	graphic_writeCommand(LCD_SET_ADD, B_CS1|B_CS2);
	graphic_writeCommand(LCD_SET_PAGE, B_CS1|B_CS2);
	
	select_controller(0);
}

void graphic_clearScreen(void){
	unsigned char i, j;
	
	for(j = 0; j < 8; j++){
		graphic_writeCommand(LCD_SET_PAGE | j, B_CS1|B_CS2 );
		graphic_writeCommand(LCD_SET_ADD | 0, B_CS1|B_CS2 );
		
		for(i = 0; i <= 63; i++){
			// Every write goes to next address
			graphic_writeData(0, B_CS1|B_CS2);
		}
	}
}

void pixel( int x, int y, int set ){
	unsigned char mask, c, controller;
	int index;
	
	if( (x > 128 ) || (y > 64) )
		return;
		
	index = (y-1)/8;
	
	switch( (y-1)%8 ){
		case 0: mask = 1; break;
		case 1: mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
	}
	
	if( set == 0)
		mask = ~mask;
		
	if(x > 64){
		controller = B_CS2;
		x = x - 65;
	} 
	else {
		controller = B_CS1;
		x = x-1;
	}
	
	graphic_writeCommand(LCD_SET_ADD | x, controller );
	graphic_writeCommand(LCD_SET_PAGE | index, controller );
	c = graphic_read( controller );
	graphic_writeCommand(LCD_SET_ADD | x, controller );
	
	if( set ) 
		mask = mask | c;
	else 
		mask = mask & c;
		
	graphic_writeData( mask, controller);
	graphic_writeCommand(LCD_ON,B_CS1|B_CS2);
}