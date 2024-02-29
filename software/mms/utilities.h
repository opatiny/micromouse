#pragma once

typedef struct pos {    
    int x;
    int y;
    int theta; // can only be 0:'N', 1:'E', 2:'S', 3:'O'
} Pos;

void printPosition(Pos position);


void move(Pos* position, int nbCells);


void turn(Pos* position, char turn);
