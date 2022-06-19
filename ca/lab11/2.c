#include "stdio.h"
#include "stdlib.h"

void swap(int* a, int* b)
{
    int dop = *a;
    *a = *b;
    *b = dop;
    return;
}
void reverse(int x, int* y)
{
    for(int i = 0; i < x / 2; i++)
    {
        swap(y + i, y + x - 1 - i);
    }
    return;
}
int main()
{
    int n;
    scanf("%d", &n);
    int* x = malloc(n);
    for(int i = 0; i < n; i++)
        scanf("%d", x + i);
    reverse(n, x);
    for(int i = 0; i < n; i++)
        printf("%d ", *(x + i));
    free(x);
}