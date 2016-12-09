#include <logic.h>

void set_object_speed(PSNAKE o, int speedx, int speedy){
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_position(int pos, PSNAKE o){
	unsigned char x;
	unsigned char y;
	
	// Loop through dots on position
	for (int j = 0; j < o->body->tile->numpoints; j++){
		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
		y = (o->body->positions[pos].y * o->body->tile->sizey) - 1 + o->body->tile->px[j].y;
		
		// Paint it
		pixel(x, y, 1);
	}
}

void clear_position(int pos, PSNAKE o){
	unsigned char x;
	unsigned char y;
	
	// Loop through dots on position
	for (int j = 0; j < o->body->tile->numpoints; j++){
		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
		y = (o->body->positions[pos].y * o->body->tile->sizey) - 1 + o->body->tile->px[j].y;
		
		// Paint it
		pixel(x, y, 0);
	}
}

void draw_object(PSNAKE o){
	
	// Loop through positions
	for (int i = 0; i < o->body->body_size; i++){
		draw_position(i, o);
	}
}

void clear_object(PSNAKE o){
	
	// Loop through positions
	for (int i = 0; i < o->body->body_size; i++){
		clear_position(i, o);
	}
}

void clear_tail(PSNAKE o){
	
	// Get tail position
	int i = o->body->body_size - 1;
	
	// Clear tail
	clear_position(i, o);
}

void draw_head(PSNAKE o){
	draw_position(0, o);
}

void move_object(PSNAKE o){
	clear_tail(o);
	
	// Loop through positions
	for (int i = o->body->body_size - 1; i > 0; i--){
		o->body->positions[i] = o->body->positions[i-1];
	}
	
	// Set new head
	o->body->positions[0].x += o->dirx;
	o->body->positions[0].y += o->diry;
	
	draw_head(o);
}