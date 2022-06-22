#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int main(int argc, const char* argv[])
{
    char** x = malloc((argc - 1) * sizeof(char*));
    for(int i = 1; i < argc - 1; i++)
    {
        x[i - 1] = argv[i];
    }
    x[argc - 2] = (char*)NULL;

    int fd = open(argv[argc - 1], O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
    close(STDOUT_FILENO);
    dup2(fd, STDOUT_FILENO);
    execvp(argv[1], x);
}