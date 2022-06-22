#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <pthread.h>

static unsigned long long res = 0;
static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;

static void* calcSum(void* arg)
{
    int* arr = ((int**)arg)[0];
    int* borders = ((int**)arg)[1];
    printf("current borders: %d %d\n", borders[0], borders[1]);

    int s = pthread_mutex_lock(&mtx);
    if (s != 0) {
        perror("pthread_mutex_lock");
        return NULL;
    }

    unsigned long long loc = res;
    for(int i = borders[0]; i < borders[1]; i++)
    {
        loc += arr[i];
        printf("current %d arr val: %d\n", i, arr[i]);
    }
    res = loc;
    printf("current %d\n", res);

    s = pthread_mutex_unlock(&mtx);
    if (s != 0) {
        perror("pthread_mutex_unlock");
        return NULL;
    }

    return NULL;
}

int main()
{
    int ss;
    time_t t;
    scanf(" %d", &ss);

    if(ss < 4)
    {
        perror("Error");
        exit(EXIT_FAILURE);
    }

    srand((unsigned) time(&t));

    int* x = malloc(ss * sizeof(int));
    printf("The resulting array is:\n");
    for(int i = 0; i < ss; i++)
    {
        x[i] = rand() % 100000;
        printf("%d\n", x[i]);
    }

    pthread_t f[4];
    for(int i = 0; i < (ss / 4) * 4; i += ss / 4)
    {
        int* temp = malloc(2 * sizeof(int));
        temp[0] = i;
        temp[1] = i + ss / 4;
        if(i == 3 * ss / 4 && ss % 2 == 1)
            temp[1] += 1;
        int** y = malloc(2 * sizeof(int*));
        y[0] = x;
        y[1] = temp;
        int s = pthread_create(&f[i / (ss / 4)], NULL, calcSum, y);

        if (s != 0)
        {
            perror("pthread_create");
            exit(EXIT_FAILURE);
        }
    }

    for (size_t i = 0; i < 4; i++)
    {
        int s = pthread_join(f[i], NULL);
        if (s != 0)
        {
            perror("pthread_join");
            exit(EXIT_FAILURE);
        }
    }

    printf("The sum is: %d\n", res);
    exit(EXIT_SUCCESS);
}
