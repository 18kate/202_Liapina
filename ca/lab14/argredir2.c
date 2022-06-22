#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int main(int argc, const char* argv[])
{
    char** x = malloc((argc - 2) * sizeof(char*));
    for(int i = 1; i < argc - 2; i++)
    {
        x[i - 1] = argv[i];
    }
    x[argc - 3] = (char*)NULL;

    pid_t pid = fork();
    if(pid == 0)
    {
        int re = dup(STDOUT_FILENO);
        int fd = open(argv[argc - 1], O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
        close(STDOUT_FILENO);
        dup2(fd, STDOUT_FILENO);

        int file = open(argv[argc - 2], O_CREAT | O_RDONLY, S_IRUSR | S_IWUSR);
        close(STDIN_FILENO);
        dup2(file, STDIN_FILENO);
        execvp(argv[1], x);
    }
    else
    {
        int* y = malloc(sizeof(int));
        wait(y);
        printf("%d", WEXITSTATUS(y));
    }
    return 0;
}