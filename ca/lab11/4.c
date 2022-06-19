#include <stdio.h>
#include <stdlib.h>

struct SingleLink
{
    int data;
    struct SingleLink* next;
};

struct SingleLink* reverse(int x, struct SingleLink* y)
{
    struct SingleLink* res = y;
    struct SingleLink* next = res->next;
    res->next = NULL;
    for(int i = 0; i < x - 1; i++)
    {
        struct SingleLink* sl = next->next;
        next->next = res;
        res = next;
        next = sl;
    }
    return res;
}

void pushLink(int counter, int data, struct SingleLink** sl)
{
    if(!(*sl))
    {
        *sl = malloc(sizeof(struct SingleLink));
        (*sl)->data = data;
        (*sl)->next = NULL;
        return;
    }

    struct SingleLink* x = *sl;

    while(x->next)
    {
        x = x->next;
    }
    x->next = malloc(sizeof(struct SingleLink));
    x->next->data = data;
    x->next->next = NULL;
}

void destroy(int counter, struct SingleLink* sl)
{
    struct SingleLink* x = sl;
    for(int i = 0; i < counter; i++)
    {
        x = x->next;
        free(sl);
        sl = x;
    }
    return;
}

int main()
{
    int x = -1;
    int counter = 0;
    struct SingleLink* sl = NULL;
    scanf("%d", &x);
    while(x)
    {
        pushLink(counter, x, &sl);
        counter++;
        scanf("%d", &x);
    }
    if(!counter)
        return 0;

    sl = reverse(counter, sl);

    struct SingleLink* f = sl;
    for(int i = 0; i < counter; i++)
    {
        printf("%d ", f->data);
        f = f->next;
    }

    destroy(counter, sl);

    return 0;
}