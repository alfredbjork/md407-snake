#include <logic.h>

void set_object_speed(POBJECT o, int speedx, int speedy){
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_object(POBJECT o){
	
	unsigned char x;
	unsigned char y;
	
	/*for (int i = 0; i < o->geo->numpoints; i++){
		
		x = o->posx + o->geo->px[i].x;
		y = o->posy + o->geo->px[i].y;
		
		pixel(x, y, 1);
	}*/
	for (int i = 0; i < 2; i++){
		for (int j = 0; j < o->geo->numpoints; j++){
			
			x = o->body[i].x + o->geo->px[j].x;
			y = o->body[i].y + o->geo->px[j].y;
			
			pixel(x, y, 1);
		}
	}
		
		pixel(x, y, 1);
}

void clear_object(POBJECT o){
	unsigned char x;
	unsigned char y;
	
	for (int i = 0; i < o->geo->numpoints; i++){
		
		x = o->posx + o->geo->px[i].x;
		y = o->posy + o->geo->px[i].y;
		
		pixel(x, y, 0);
	}
}

void move_object(POBJECT o){
	clear_object(o);
	
	// Set new position
	o->posx += o->dirx;
	o->posy += o->diry;
	
	if (o->posx < 1) { // Object is on its way out to the left
		o->dirx = - o->dirx;
	}
	
	if (o->posx + o->geo->sizex > 128){ // Object is on its way out to the right
		o->dirx = - o->dirx;
	}
	
	if (o->posy < 1) { // Object is on its way out at the top
		o->diry = - o->diry;
	}
	
	if (o->posy + o->geo->sizey > 64){ // Object is on its way out at the bottom
		o->diry = - o->diry;
	}
	
	draw_object(o);
}