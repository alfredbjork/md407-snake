/*
 * 	startup.c
 *
 */
#include <logic.h>
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

void main(void){
	
	graphic_IO_init();
	
	graphic_initalize();
	
	#ifndef SIMULATOR
		graphic_clearScreen();
	#endif
	
	
	POINT body[2] = {{0,0},{0,1}}; //newly added 12-06
	GEOMETRY ball_geometry = {
		4,
		2,2,
		{
			{0,0}, {0,1}, {1,0}, {1,1}
		}
	};

	OBJECT ball = {
		&ball_geometry,		// Geometry for ball
		0,0,				// Initial direction
		body, //newly added 12-06
		1,1,				// Initial position
		draw_object,
		clear_object,
		move_object,
		set_object_speed
	};
	
	
	
	
}

