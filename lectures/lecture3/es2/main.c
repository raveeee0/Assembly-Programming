long int sums(long int n, long int m) { 
    return n * m + 17; 
}

long int big_fun(long int a, long int b, long int c, long int d, long int e, long int f, long int g) {
    return c + sums(d, g) + a * b + f + e;
}

void main() {
    int a = 1, b = 2, c = 3, d = 4, e = 5, f = 6, g = 7, res;
    res = big_fun(a, b, c, d, e, f, g);
}