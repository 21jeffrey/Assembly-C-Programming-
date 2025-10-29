#include <stdio.h>

unsigned long long factorial(unsigned int n) {
    unsigned long long res = 1;
    for (unsigned int i = 1; i <= n; ++i) {
        res *= i;
    }
    return res;
}

int main(void) {
    unsigned int n;
    printf("Enter a non-negative integer: ");
    if (scanf("%u", &n) != 1) {
        return 1;
    }
    printf("Factorial(%u) = %llu\n", n, factorial(n));
    return 0;
}