#define N 10
long int vect[N];

void clear_array(int *array, long size) {
    long int *p;
    for (p = array; p < array + size; p++) {
        *p = 0;
    }
}

int main() {
    clear_array(vect, N);
    return 0;
}