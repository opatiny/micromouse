/**
 * API downloaded from the mms-c repository by mackorone and modified
 * https://github.com/mackorone/mms-c?tab=readme-ov-file
*/

#pragma once

#include "utilities.h"

int API_mazeWidth();
int API_mazeHeight();

int API_wallFront();
int API_wallRight();
int API_wallLeft();

int API_moveForward(Pos* pos);  // Returns 0 if crash, else returns 1
void API_turnRight(Pos* pos);
void API_turnLeft(Pos* pos);

void API_setWall(int x, int y, char direction);
void API_clearWall(int x, int y, char direction);

void API_setColor(int x, int y, char color);
void API_clearColor(int x, int y);
void API_clearAllColor();

void API_setText(int x, int y, char* str);
void API_clearText(int x, int y);
void API_clearAllText();

int API_wasReset();
void API_ackReset();

// CUSTOM FUNCTIONS
void updateSensors(Sensors* sensors);
void setSensedWalls(Maze maze, Point point);