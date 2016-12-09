#ifndef LOGIC_H
#define LOGIC_H
typedef struct tPoint{
	unsigned char x;
	unsigned char y;
}POINT;

#define MAX_POINTS 20

typedef struct tGeometry{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[ MAX_POINTS ];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj{
	PGEOMETRY geo;
	int		dirx, diry;
	POINT 	body[2]; 
	int 	posx, posy;
	void 	(* draw) (struct tObj *);
	void	(* clear) (struct tObj *);
	void 	(* move) (struct tObj *);
	void 	(* set_speed) (struct tObj *, int, int);
} OBJECT, *POBJECT;

void set_object_speed(POBJECT, int, int);
void draw_object(POBJECT);
void clear_object(POBJECT);
void move_object(POBJECT);

#else
#endif