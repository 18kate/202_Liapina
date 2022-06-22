#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

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

    if(fork() == 0)
    {
	fprintf(stderr, "program %s command %s\n", argv[1], argv[2]);
        close(f[0]);
        dup2(f[1], STDOUT_FILENO);
        execlp(argv[1], argv[1]);
    }
    else
    {
        wait(NULL);
        close(f[1]);
        dup2(f[0], STDIN_FILENO);
        execvp(argv[2], x);
    }
    return 0;
}