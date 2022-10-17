#include<stdio.h>

#define N 10


typedef long long int LONG;

LONG vet[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

void printArray(LONG vect[]);


int main() {
    printArray(vet);

    return;
}

void printArray(LONG *vect) {
    for (int i = 0; i < N; i++) {
        printf("%d\t", vect[i]);
    }

    printf("\n");
    return;
}
