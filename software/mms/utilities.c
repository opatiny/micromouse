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

void printMazeCell(Maze maze, int x, int y) {
    for (int i = 0; i< NB_WALLS; i++) {
    fprintf(stderr, "%i ", maze[y][x][i]);
    }
    fprintf(stderr, "\n");
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
void initMaze(Maze maze, uint8_t width, uint8_t height) {
    for (uint8_t h = 0; h < height; h++) {
        for (uint8_t w = 0; w < width; w++) {
            for (uint8_t i = 0; i  < NB_WALLS; i++) {
                maze[h][w][i] = 2;
            }
        }
    }
}

void updateCellWalls(Maze maze, uint8_t x, uint8_t y, Cell values) {

}