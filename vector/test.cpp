#pragma GCC optimize("O0","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC option("arch=native","tune=native","no-zeroupper") //Enable AVX
#pragma GCC target("avx", "avx2", "sse", "sse2", "sse3", "ssse3")  //Enable AVX
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>

__attribute__((optimize("no-tree-vectorize"))) //Force disable auto-vectorization

char *mysecret = "I see NetSpectre via performance counter.";
__m256i v;

int main(){
    int i;
    v = _mm256_loadu_si256((__m256i *)&mysecret[0]);
    char c[80];
    _mm256_storeu_si256((__m256i*) &c, v);
    for (i = 0; i < 32; i++)
        printf("%c", c[i]);
    printf("\n");
    return 0;
}
// gcc -march=native -fopt-info-vec-optimized test.cpp -o test