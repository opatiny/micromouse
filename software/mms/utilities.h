#pragma once
#include <stdint.h>

#include "constants.h"

// STRUCTURES
typedef struct point {
    int x;
    int y;
} Point;

typedef struct pos {    
    Point point;
    int theta; // can only be 0:'N', 1:'E', 2:'S', 3:'O'
} Pos;

// TYPES
typedef uint8_t Cell[NB_WALLS]; // walls in order NESW
typedef uint8_t Maze[MAZE_HEIGHT][MAZE_WIDTH][NB_WALLS];

// FUNCTIONS DECLARATIONS
void print(char* text);
void printPosition(Pos position);
void printMazeCell(Maze maze, int x, int y);

void move(Pos* position, int nbCells);
void turn(Pos* position, char turn);

int getSquaredDistance(Point p1, Point p2);

void initMaze(Maze maze, uint8_t width, uint8_t height);
