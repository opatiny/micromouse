#include <stdio.h>
#include <math.h>

#include "API.h"
#include "utilities.h"
#include "constants.h"

// CONSTANTS
int maxSquaredDistance = 256; // distance always bigger that distance to center
char orientations[5] = {'N','E','S','W'};

// DEBUG FUNCTIONS
void print(char* text) {
    fprintf(stderr, "%s\n", text);
    fflush(stderr);
}
void printPosition(Pos position) {
    fprintf(stderr, "%i, %i, %c\n", position.point.x, position.point.y, orientations[position.theta]);
    fflush(stderr);
}

void printSensors(Sensors sensors) {
    fprintf(stderr, "%i %i %i\n", sensors.left, sensors.front, sensors.right);
    fflush(stderr);
}

void printMazeCell(Maze maze, Point point) {
    for (int i = 0; i < NB_WALLS; i++) {
    fprintf(stderr, "%i ", maze[point.y][point.x][i]);
    }
    fprintf(stderr, "\n");
    fflush(stderr);
}

// KEEP TRACK OF CURRENT POS
/**
 * Update robot position after forward movement of nbCells cells.
 */
void move(Pos* position, int nbCells) {
    switch (position->theta) {
        case 0: // N
            position->point.y += nbCells;
            break;
        case 1: // E
           position->point.x += nbCells;
            break;
        case 2: // S
           position->point.y -= nbCells;
            break;
        case 3: // W
           position->point.x -= nbCells;
            break;
        default:
            fprintf(stderr, "Unknown value for theta: %i\n", position->theta);
            break;
    }
}

/**
 * Update robot position after turn.
 * turn: can be left 'L' or right 'R'
 */

void turn(Pos* position, char turn) {
    int tmp = position->theta;
    switch (turn) {
        case 'L':
            tmp = (position->theta + 3);
            break;
        case 'R':
            tmp = (position->theta + 1);
            break;
        default:
            fprintf(stderr, "Unknown value for turn: %c\n", turn);
            break;
    }

    position->theta = tmp % 4;
}

// POINTS
/**
 * Get squared distance between two cells.
*/
int getSquaredDistance(Point p1, Point p2) {
    return pow(p1.x - p2.x, 2) + pow(p1.x - p2.x, 2);
}

// MAZE

/**
 * Fill maze with 2 to tell we did not visit these cells yet.
 * Visited cells will be filled with 1 or 0 depending on presence of walls.
*/
void initMaze(Maze maze) {
    for (uint8_t h = 0; h < MAZE_HEIGHT; h++) {
        for (uint8_t w = 0; w < MAZE_WIDTH; w++) {
            for (uint8_t i = 0; i  < NB_WALLS; i++) {
                maze[h][w][i] = 2;
            }
        }
    }
}

/**
 * Update the current cell walls in the maze 3D array.
*/
void updateCellWalls(Maze maze, Pos pos, Sensors sensors) {

    Cell *currentCell = &maze[pos.point.y][pos.point.x];

    uint8_t leftIndex = (3 + pos.theta)%4;
    uint8_t topIndex = pos.theta;
    uint8_t rightIndex = (1 + pos.theta)%4;
    uint8_t bottomIndex = (2 + pos.theta)%4;
    fprintf(stderr, "t: %i, r: %i, b: %i, l: %i\n", topIndex, rightIndex, bottomIndex, leftIndex);
    fflush(stderr);

    if(sensors.left) {
    fprintf(stderr, " l: %i\n",currentCell[leftIndex]);
    fflush(stderr);
        *currentCell[leftIndex] = 1;
    } else {
         *currentCell[leftIndex] = 0;
    }
    if(sensors.front) {
    fprintf(stderr, " t: %i\n",currentCell[topIndex]);
    fflush(stderr);
       *currentCell[topIndex] = 1;
    } else {
        *currentCell[topIndex] = 0;
    }
    if(sensors.right) {
        *currentCell[rightIndex] = 1;
    } else {
        *currentCell[rightIndex] = 0;
    }
    *currentCell[bottomIndex] = 0;


}

/**
 * Find wether a cell is an intersections of not.
 * By definition, an intersection only have 1 or 0 walls.
*/
bool isIntersection(Maze maze, Point point) {
    int sum = 0;
    for(int i = 0; i < NB_WALLS; i++) {
        sum += maze[point.y][point.x][i];
    }
    // fprintf(stderr, "%i\n", sum);
    if (sum < 2) {
        return true;
    }
    return false;
}