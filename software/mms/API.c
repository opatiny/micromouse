/**
 * API downloaded from the mms-c repository by mackorone and modified 
 * https://github.com/mackorone/mms-c?tab=readme-ov-file
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "utilities.h"

#define BUFFER_SIZE 32

int getInteger(char* command) {
    printf("%s\n", command);
    fflush(stdout);
    char response[BUFFER_SIZE];
    fgets(response, BUFFER_SIZE, stdin);
    int value = atoi(response);
    return value;
}

int getBoolean(char* command) {
    printf("%s\n", command);
    fflush(stdout);
    char response[BUFFER_SIZE];
    fgets(response, BUFFER_SIZE, stdin);
    int value = (strcmp(response, "true\n") == 0);
    return value;
}

int getAck(char* command) {
    printf("%s\n", command);
    fflush(stdout);
    char response[BUFFER_SIZE];
    fgets(response, BUFFER_SIZE, stdin);
    int success = (strcmp(response, "ack\n") == 0);
    return success;
}

int API_mazeWidth() {
    return getInteger("mazeWidth");
}

int API_mazeHeight() {
    return getInteger("mazeHeight");
}

int API_wallFront() {
    return getBoolean("wallFront");
}

int API_wallRight() {
    return getBoolean("wallRight");
}

int API_wallLeft() {
    return getBoolean("wallLeft");
}

int API_moveForward(Pos* pos) {
    move(pos, 1);
    return getAck("moveForward");
}

void API_turnRight(Pos* pos) {
    turn(pos, 'R');
    getAck("turnRight");
}

void API_turnLeft(Pos * pos) {
    turn(pos, 'L');
    getAck("turnLeft");
}

void API_setWall(int x, int y, char direction) {
    printf("setWall %d %d %c\n", x, y, direction);
    fflush(stdout);
}

void API_clearWall(int x, int y, char direction) {
    printf("clearWall %d %d %c\n", x, y, direction);
    fflush(stdout);
}

void API_setColor(int x, int y, char color) {
    printf("setColor %d %d %c\n", x, y, color);
    fflush(stdout);
}

void API_clearColor(int x, int y) {
    printf("clearColor %d %d\n", x, y);
    fflush(stdout);
}

void API_clearAllColor() {
    printf("clearAllColor\n");
    fflush(stdout);
}

void API_setText(int x, int y, char* text) {
    printf("setText %d %d %s\n", x, y, text);
    fflush(stdout);
}

void API_clearText(int x, int y) {
    printf("clearText %d %d\n", x, y);
    fflush(stdout);
}

void API_clearAllText() {
    printf("clearAllText\n");
    fflush(stdout);
}

int API_wasReset() {
    return getBoolean("wasReset");
}

void API_ackReset() {
    getAck("ackReset");
}

// CUSTOM FUNCTIONS
/**
 * Read the values of the three sensors at the current cell
*/
void updateSensors(Sensors* sensors) {
    sensors->left = API_wallLeft();
    sensors->front = API_wallFront();
    sensors->right = API_wallRight();
}

/**
 * Highlight detected walls
*/
void setSensedWalls(Maze maze, Point point) {
    Cell currentCell = maze[point.y][point.x];

    if(currentCell[0]) {
        API_setWall(point.x, point.y, 'n');
    }
    if(currentCell[1]) {
        API_setWall(point.x, point.y, 'e');
    }
     if(currentCell[2]) {
        API_setWall(point.x, point.y, 's');
    }
    if(currentCell[3]) {
        API_setWall(point.x, point.y, 'w');
    }
}