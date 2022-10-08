#define N 10

long int vect[N];

void clear_array(long int array[], long size) {
    long int i;
    for (i = 0; i < size; i++) {
        array[i] = 0;
    }
}

int main() {
        clear_array(vect, N);
        return 0;
}