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

    uint8_t width = API_mazeWidth();
    uint8_t height = API_mazeHeight();

    if (width != MAZE_WIDTH || height != MAZE_HEIGHT) {
        print("Error: Predefined maze size doesn't match loaded maze.");
    }

    Maze maze;

    initMaze(maze, width, height);

    print("Running...");

    printPosition(pos);

    while (1) {
        Cell currentCell = {1,1,1,1};


        if (!API_wallLeft()) {
            API_turnLeft(&pos);
        }
        while (API_wallFront()) {
            API_turnRight(&pos);
        }
        API_moveForward(&pos);

        printPosition(pos);
    }
}

