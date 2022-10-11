#define N 10

long VECTOR[N];

void fillArray(int start);

void main() {
    fillArray(9);
}

void fillArray(int start) {
    for(int i = 0; i < N; i++, start+=2) {
        VECTOR[i] = start;
    }

    return;
}