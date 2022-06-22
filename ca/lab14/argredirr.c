#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int main(int argc, const char* argv[])
{
    char** x = malloc((argc - 2) * sizeof(char*));
    if(x == NULL)
    {
        perror("Error has occured during an attempt to allocate memory.");
        exit(EXIT_FAILURE);
    }
    for(int i = 3; i < argc; i++)
    {
        x[i - 3] = argv[i];
    }
    x[argc - 3] = (char*)NULL;

    pid_t pid = fork();
    if(pid == 0)
    {
        int fd = open(argv[2], O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
        if(fd == -1)
        {
            perror("Error");
            exit(EXIT_FAILURE);
        }
        close(STDOUT_FILENO);
        int err = dup2(fd, STDOUT_FILENO);
        if(err == -1)
        {
            perror("Error");
            exit(EXIT_FAILURE);
        }

        int re = open(argv[1], O_CREAT | O_RDONLY, S_IRUSR | S_IWUSR);
        if(re == -1)
        {
            perror("Error");
            exit(EXIT_FAILURE);
        }
        close(STDIN_FILENO);
        err = dup2(re, STDIN_FILENO);
        if(err == -1)
        {
            perror("Error");
            exit(EXIT_FAILURE);
        }
        execvp(argv[3], x);
    }
    else if(pid == -1)
    {
        perror("Fork failed.");
        exit(EXIT_FAILURE);
    }
    else
    {
        int* res = malloc(sizeof(int));
        if(res == NULL)
        {
            perror("Error has occured during an attempt to allocate memory.");
            exit(EXIT_FAILURE);
        }
        wait(res);
        printf("wexitstatus %d", WEXITSTATUS(res));
    }
    return 0;
}