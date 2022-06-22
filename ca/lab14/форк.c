#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x[2];

    switch(fork())
    {
        case -1:
            perror("error");
            exit(EXIT_FAILURE);
        case 0:
            switch(fork())
            {
                case -1:
                    perror("error");
                    exit(EXIT_FAILURE);
                case 0:
                    printf("Hello from a parent's subson\n");
                    exit(EXIT_SUCCESS);
                default:
                    wait(NULL);
                    printf("Hello from a parent's son\n");
            }
            exit(EXIT_SUCCESS);
        default:
            wait(NULL);
            printf("Hello from a parent\n");
    }
    return 0;
}