#include "stdio.h"
#include "stdlib.h"

unsigned long* transpose(int n, int m, unsigned long* s)
{
    unsigned long* tr = malloc(sizeof(unsigned long) * m);
    for (int i = 0; i < m; i++)
    {
        int* x = malloc(sizeof(int) *n);
        for(int j = 0; j < n; j++)
        {
            int* row = *(s + j);
            *(x + j) = *(row + i);
        }
        *(tr + i) = x;
    }
    return tr;
}

int main()
{
    int n, m;
    scanf("%d %d", &n, &m);
    unsigned long* tr = malloc(sizeof(unsigned long) *n);
    for (int i = 0; i < n; i++)
    {
        int* r = malloc(m);
        for(int j = 0; j < n; j++)
            scanf("%d", r + j);
        *(tr + i) = r;
    }

    unsigned long* res = transpose(n, m, tr);
    printf("\n");
    for (int i = 0; i < m; i++)
    {
        int* x = *(res + i);
        for(int j = 0; j < n; j++)
            printf("%d ", *(x + j));
        printf("\n");
        free(x);
    }
    free(res);
}



