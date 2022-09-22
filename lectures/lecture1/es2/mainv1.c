// trova il valore massimo dell’array
int vett[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int max;
int i;
int *p;

int main()
{
    max = vett[0];
    p = vett;
    for (i = 0; i < 10; i++)
    {
        if (*p > max)
            max = *p;
    }

    return 0;
}  