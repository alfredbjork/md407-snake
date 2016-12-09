#define GPIO_D_BASE 0x40020C00

void keypad_init(void){
	unsigned int *base_addr = GPIO_D_BASE;
	
	// Setup GPIO D
	// GPIO_MODER
	*base_addr = 0x55005555 | (*base_addr & 0x00000000);
	
	// GPIO_OTYPER
	*(base_addr + 1) = 0x00000F00 | (*(base_addr + 1) & 0x000000FF);
	
	// GPIO_PUPDR
	*(base_addr + 3) = 0x00AA0000 | (*(base_addr + 3) & 0x0000FFFF);
}

void activateRow ( int row ){
	
	// Outport
	unsigned char *keyb_out = GPIO_D_BASE;
	keyb_out += 21;
	
	switch (row + 1){
		case 1:
			*keyb_out = 0x10;
			break;
		
		case 2:
			*keyb_out = 0x20;
			break;
			
		case 3:
			*keyb_out = 0x40;
			break;
		
		case 4:
			*keyb_out = 0x80;
			break;
			
		default:
			break;
	}
}

int readColumn( void ){
	
	// Inport
	unsigned char *keyb_in = GPIO_D_BASE;
	keyb_in += 17;
	
	unsigned short in_val = *keyb_in;
	
	if (in_val & 0x01){
		return 1;
	}
	
	if (in_val & 0x02){
		return 2;
	}
	
	if (in_val & 0x04){
		return 3;
	}
	
	if (in_val & 0x08){
		return 4;
	}
	
	return 0;
	
}

unsigned char keyb( void ){
	
	// Keyvalues based on row and column. keyValue[row][column]
	static char keyValue[4][4] = {
		{1,2,3,10},
		{4,5,6,11},
		{7,8,9,12},
		{14,0,15,13}
	};
	
	// Loop through every row of keys
	for (int i = 0; i < 4; i++){
		activateRow( i );
		int column = readColumn();
		if (column != 0){
			return keyValue[i][column - 1];
		}
	}
	
	// No key pressed
	return 0xFF;
}

void out7seg( unsigned char c ){
	
	static char segCodes [16] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};
	
	// Outport
	unsigned char *disp_out = GPIO_D_BASE;
	disp_out += 20;
	
	if (c > 15){
		*disp_out = 0;
	}else{
		*disp_out = segCodes[c];
	}
}