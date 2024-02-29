#include <stdio.h>

#include "API.h"
#include "utilities.h"

char orientations[5] = {'N','W','S','E', '\0'};
    
void printPosition(Pos position) {
    fprintf(stderr, "%i, %i, %c\n", position.x, position.y, orientations[position.theta]);
    fflush(stderr);
}

void move(Pos* position, int nbCells) {
    switch (position->theta) {
        case 0: // N
            position->y += nbCells;
            break;
        case 1: // W
           position->x -= nbCells;
            break;
        case 2: // S
           position->y -= nbCells;
            break;
        case 3: // E
           position->x += nbCells;
            break;
        default:
            fprintf(stderr, "Unknown value for theta: %i\n", position->theta);
            break;
    }
}

void turn(Pos* position, char turn) {
    int tmp = position->theta;
    switch (turn) {
        case 'L':
            tmp = (position->theta + 1);
            break;
        case 'R':
            tmp = (position->theta + 3);
            break;
        default:
            fprintf(stderr, "Unknown value for turn: %c\n", turn);
            break;
    }

    position->theta = tmp % 4;
}