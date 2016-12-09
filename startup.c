/*
 * 	startup.c
 *
 */
#include <logic.h>
#include <keypad.h>

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

void updateDir(PSNAKE o){
	unsigned char key = keyb();
	
	switch (key){
		case 2:
			o->set_speed(o, 0, -1);
			break;
		
		case 4:
			o->set_speed(o, -1, 0);
			break;
			
		case 6:
			o->set_speed(o, 1, 0);
			break;
			
		case 8:
			o->set_speed(o, 0, 1);
			break;
	}
}

void main(void){
	
	graphic_IO_init();
	
	graphic_initalize();
	
	#ifndef SIMULATOR
		graphic_clearScreen();
	#endif
	
	keypad_init();
	
	GEOMETRY dot_geometry = {
		4,
		2,2,
		{
			{0,0}, {0,1}, {1,0}, {1,1}
		}
	};
	
	BODY body = {
		&dot_geometry,		// Geometry for ball
		2,					// Initial body size
		{{5,5},{5,4}}		// Initital body pos
	};

	SNAKE snake = {
		0,1,				// Initial direction
		&body, 				// Snake body
		true,				// Snake is alive
		draw_object,
		clear_object,
		move_object,
		set_object_speed
	};
	
	// Draw initial snake
	snake.draw(&snake);
	
	// Gameloop
	while(snake.is_alive){
		
		updateDir(&snake);
		snake.move(&snake);
	}
	
}

