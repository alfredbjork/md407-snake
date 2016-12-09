#ifndef LOGIC_H
#define LOGIC_H

typedef struct tPoint{
	unsigned char x;
	unsigned char y;
}POINT;

#define MAX_POINTS 4

typedef struct tGeometry{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[ MAX_POINTS ];
} GEOMETRY, *PGEOMETRY;

#define MAX_BODY_SIZE 20

typedef struct tBody{
	PGEOMETRY 		tile;
	unsigned int	body_size;
	POINT			positions[ MAX_BODY_SIZE ]; 
} BODY, *PBODY;

typedef enum { false, true } bool;

typedef struct tObj{
	int		dirx, diry;
	PBODY	body;
	bool	is_alive;
	void 	(* draw) (struct tObj *);
	void	(* clear) (struct tObj *);
	void 	(* move) (struct tObj *);
	void 	(* set_speed) (struct tObj *, int, int);
} SNAKE, *PSNAKE;

void set_object_speed(PSNAKE, int, int);
void draw_object(PSNAKE);
void clear_object(PSNAKE);
void move_object(PSNAKE);

#else
#endif