#include <stdio.h>

#include "API.h"
#include "utilities.h"

void log(char* text) {
    fprintf(stderr, "%s\n", text);
    fflush(stderr);
}

int main(int argc, char* argv[]) {
    API_setColor(0, 0, 'G');
    API_setText(0, 0, "S");

    Pos pos;
    pos.x = 0;
    pos.y = 0;
    pos.theta = 0;

    log("Running...");

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

