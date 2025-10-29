#include <stdio.h>
#include <stdint.h>

// Assembly function: uint64_t fact_asm(uint32_t n);
extern unsigned long long fact_asm(unsigned int n);

int main(void) {
    unsigned int n;
    printf("Enter n: ");
    if (scanf("%u", &n) != 1) return 1;
    unsigned long long f = fact_asm(n);
    printf("fact(%u) = %llu\n", n, f);
    return 0;
}
