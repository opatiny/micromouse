#include <stdio.h>

#include "API.h"
#include "constants.h"
#include "utilities.h"


int main(int argc, char* argv[]) {
    API_setColor(0, 0, 'G');
    API_setText(0, 0, "S");

    Pos pos;
    pos.point.x = 0;
    pos.point.y = 0;
    pos.theta = 0;

    int width = API_mazeWidth();
    int height = API_mazeHeight();

    if (width != MAZE_WIDTH || height != MAZE_HEIGHT) {
        print("Predefined maze size doesn't match loaded maze.");
    }

    Maze maze;

    initMaze(maze, width, height);

    printMazeCell(maze, 0, 0);

    print("Running...");

    printPosition(pos);

    while (1) {
        if (!API_wallLeft()) {
            API_turnLeft();
            turn(&pos, 'L');
        }
        while (API_wallFront()) {
            API_turnRight();
            turn(&pos, 'R');
        }
        API_moveForward();
        move(&pos, 1);
        printPosition(pos);
    }
}

