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

/**
 * FOOD FUNCTIONS
 */

/**
 * @brief Checks if any of the snakes body tiles is on the same position as the food
 */
bool snake_eats_food(PSNAKE s, PFOOD f){
	
	bool x_eq;
	bool y_eq;
	
	// Loop trough all parts of snake body
	for (int i = 0; i < s->body->body_size; i++){
		x_eq = false;
		y_eq = false;
		
		x_eq = s->body->positions[i].x == f->position.x;
		y_eq = s->body->positions[i].y == f->position.y;
		
		if (x_eq && y_eq)
			return true;
	}
	
	return false;
}

/**
 * @brief Checks if the snake head is on the same position as the food
 */
bool head_eats_food(PSNAKE s, PFOOD f){
	
	bool x_eq = false;
	bool y_eq = false;
	
	x_eq = s->body->positions[0].x == f->position.x;
	y_eq = s->body->positions[0].y == f->position.y;
	
	return x_eq && y_eq;
}

void spawn_food(PSNAKE s, PFOOD f){
	
	static int i = 0;
	
	// Temporary solution without random number generator
	do{
		switch (i){
			case 0:
				f->position.x = 5;
				f->position.y = 10;
				break;
				
			case 1:
				f->position.x = 50;
				f->position.y = 28;
				break;
				
			case 2:
				f->position.x = 31;
				f->position.y = 1;
				break;
				
			case 3:
				f->position.x = 15;
				f->position.y = 18;
				break;
				
			case 4:
				f->position.x = 22;
				f->position.y = 31;
				break;
		}
		
		i++;
		
	} while(snake_eats_food(s,f));
	
	// Randomize until food does not collide with snake
	/*do{
		f->position.x = random(64);
		f->position.y = random(32);
	} while(snake_eats_food(s,f));*/
	
	unsigned char x;
	unsigned char y;
	
	// Draw the food
	for (int j = 0; j < f->tile->numpoints; j++){
		x = (f->position.x * f->tile->sizex) - 1 + f->tile->px[j].x;
		y = (f->position.y * f->tile->sizey) - 1 + f->tile->px[j].y;
		
		// Paint it
		pixel(x, y, 1);
	}
}