#include <stdlib.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
    printf(strcat(getenv("PATH"),"\n"));
}