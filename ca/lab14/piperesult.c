#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

int main(int argc, const char* argv[])
{
    char** x = malloc((argc - 2) * sizeof(char*));
    for(int i = 3; i < argc; i++)
    {
        x[i - 3] = argv[i];
    }
    x[argc - 3] = (char*)NULL;

    int f[2];
    pipe(f);

    int pid1 = fork();
    if(pid1 == 0)
    {
        fprintf(stderr, "command1 process %d\n", getpid());
        close(STDOUT_FILENO);
        close(f[0]);
        dup2(f[1], STDOUT_FILENO);
        close(f[1]);
        execlp(argv[1], argv[1]);
    }
    else
    {
        fprintf(stderr, "parent process %d\n", getpid());
        int* re = malloc(sizeof(int));
        if (re == NULL)
        {
            perror("Unepicity has occured during an attempt to allocate memory.");
            exit(EXIT_FAILURE);
        }

        int pid2 = fork();
        if (pid2 == 0)
        {
            fprintf(stderr, "command2 process %d\n", getpid());
            close(STDIN_FILENO);
            close(f[1]);
            dup2(f[0], STDIN_FILENO);
            close(f[0]);
            execvp(argv[2], x);
        }
        else
        {
            close(f[0]);
            close(f[1]);

            fprintf(stderr, "wait process %d\n", getpid());
            int counter = 1;
            while(wait(re) > 0)
            {
                printf("wexitstatus COMMAND %d: %d\n", counter, WEXITSTATUS(re));
                counter++;
            }
        }
    }

    return 0;
}