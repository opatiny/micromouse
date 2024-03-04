#include <stdio.h>

#include "API.h"
#include "constants.h"
#include "utilities.h"


int main(int argc, char* argv[]) {
    API_setColor(0, 0, 'G');
    API_setText(0, 0, "S");

    Pos pos = {0,0,0};

    Sensors sensors = {0,0,0};

    uint8_t width = API_mazeWidth();
    uint8_t height = API_mazeHeight();

    if (width != MAZE_WIDTH || height != MAZE_HEIGHT) {
        print("Error: Predefined maze size doesn't match loaded maze.");
    }

    Maze maze;
    initMaze(maze);

    print("Running...");

    // printPosition(pos);

    while (1) {
        updateSensors(&sensors);
        printSensors(sensors);
        printMazeCell(maze, pos.point);
        updateCellWalls(maze, pos, sensors);
        printMazeCell(maze, pos.point);
        setSensedWalls(maze, pos.point);
        if(isIntersection(maze, pos.point)) {
            API_setText(pos.point.x, pos.point.y, "I");
        } else {
            API_setText(pos.point.x, pos.point.y, "x");
        }

        if (!API_wallLeft()) {
            API_turnLeft(&pos);
        }
        while (API_wallFront()) {
            API_turnRight(&pos);
        }
        API_moveForward(&pos);

        // printPosition(pos);
    }
}

