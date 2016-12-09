#define SYSTICK_VEC ((void (**)(void)) 0x2001C03C)

#define SYSTICK_CTRL ((unsigned long *) 0xE000E010)
#define SYSTICK_LOAD ((unsigned long *) 0xE000E014)
#define SYSTICK_VAL ((unsigned long *) 0xE000E018)

#ifdef SIMULATOR
#define MS_CONSTANT 1
#else
#define MS_CONSTANT 1
#endif

static char systick_flag;

void systick_irq_handler(void){
	// Deactivate counter
	*SYSTICK_CTRL &= 0xFFFFFFFE;
	
	systick_flag = 1;
}

void delay_250ns(){
	// Initiera avbrottsvektor
	*SYSTICK_VEC = &systick_irq_handler;
	
	systick_flag = 0;
	
	// Reset SysTick
	*SYSTICK_CTRL = 0;
	
	// Load CountValue (250ns = 42 cycles)
	//*SYSTICK_LOAD = 42;
	*SYSTICK_LOAD = 10;
	
	// Reset count register
	*SYSTICK_VAL = 0;
	
	// Restart counter
	*SYSTICK_CTRL = 7;
}

void delay(unsigned int count){
	for (int i = 0; i < count; i++){
		delay_250ns();
		while(systick_flag != 1){}
	}
}

void delay_500ns( void ){
	// Delay 2*250ns
	delay(2);
}

void delay_micro( unsigned int us ){
	
	// Count micro seconds
	for (us; us > 0; us--){
		
		// Delay 4*250ns
		delay(4);
		
	}
	
}

void delay_milli( unsigned int ms ){
	
	// Count milli seconds
	for (int i = 0; i < ms; i++){
		
		// Count micro seconds
		delay_micro(MS_CONSTANT);
		
	}
}