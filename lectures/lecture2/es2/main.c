long int v[10];
long int *p;

void foo(long int n) {
    long int i;
    p = v;
    for (i = 0; i < 10; i++) {
        *p = *p + n;
        p++;
    }
}

void main() { 
    foo(5); 
}