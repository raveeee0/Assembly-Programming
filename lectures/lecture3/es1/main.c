long int potenza(long int n, long int exp) {
    if (exp == 0) {
        return 1;
    }
    else {
        return n * potenza(n, exp - 1);
    }
}

void main() {
    potenza(2, 5);
}