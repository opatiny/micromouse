#pragma once
#include <stdint.h>
#include <stdbool.h>

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

typedef struct sensors {
    uint8_t left;
    uint8_t front;
    uint8_t right;
} Sensors;

enum WallState {
    NO_WALL,
    WALL,
    UNKNOWN
};

// TYPES
typedef uint8_t Cell[NB_WALLS]; // walls in order NESW
/**
 * Maze contains the data of the wall detected by the mouse.
 * The data contains the rows of the maze from bottom to top (positive y)
 * and then the column from left to right (positive x).
*/
typedef uint8_t Maze[MAZE_HEIGHT][MAZE_WIDTH][NB_WALLS];

// FUNCTIONS DECLARATIONS
void print(char* text);
void printPosition(Pos position);
void printMazeCell(Maze maze, Point point);
void printSensors(Sensors sensors);

void move(Pos* position, int nbCells);
void turn(Pos* position, char turn);

int getSquaredDistance(Point p1, Point p2);

void initMaze(Maze maze);
void updateCellWalls(Maze maze, Pos pos, Sensors sensors);
bool isIntersection(Maze maze, Point point);