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
int array1[64 * 4096];
uint8_t unused1[64];
int array2[200005];
int array3[64];

__m256i v0, v1, v2, v3, v4, v5;
__m256i vi0, vi1, vi2, vi3, vi4, vi5;
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

void alignment() {
    /*
    * scalar store, vector load
    * scalar load, vector store
    */
    int vindex[65], junk;
    uint64_t time1, time2, time3, time4, time5;
    for (int i = 0; i < 64; i++) {
        vindex[i] = i * 64 + i;
        array1[vindex[i]] = i + 1;
    }
    junk = 0;
    v1 = _mm256_set_epi32(0, 64*1+1, 64*2+2, 64*3+3, 64*4+4, 64*5+5, 64*6+6, 64*7+7);
    v4 = _mm256_set_epi32(0, 1, 2, 3, 4, 5, 6, 7);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v2 = _mm256_load_si256((__m256i*) &array1[0]);
        time2 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time3 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v5 = _mm256_i32gather_epi32(array1, v4, 1);
        time4 = __rdtscp((uint32_t *)(&junk));
        printf("Time1 = %llu\nTime2 = %llu\nTime3 = %llu\n\n", time2 - time1, time3 - time2, time4 - time3);
    }
    
}

void alignment2() {
    /*
    * one scalar
    * non scalar
    * all scalar
    */
    int vindex[65], junk;
    uint64_t time1, time2, time3, time4, time5;
    junk = 0;
    // all scalar
    for (int i = 0; i < 64; i++) {
        vindex[i] = i * 64 + i;
        array1[i] = i + 1;
    }
    v1 = _mm256_set_epi32(0, 1, 2, 3, 4, 5, 6, 7);
    v2 = _mm256_set_epi32(1, 2, 3, 4, 5, 6, 7, 8);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time1 = %llu\n", time2 - time1);
    }
    printf("\n");

    // non scalar
    //_mm256_i32scatter_epi32(array1, v1, v2, 1);
    _mm256_store_si256((__m256i*) &array1[0], v2);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time2 = %llu\n", time2 - time1);
    }
    printf("\n");

    // one scalar
    _mm256_store_si256((__m256i*) &array1[0], v2);
    array1[0] = 9;
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time3 = %llu\n", time2 - time1);
    }
    printf("\n");

    // half scalar gather
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 221);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1+1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time4 = %llu\n", time2 - time1);
    }
    printf("\n");

    // half scalar
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_load_si256((__m256i*) &array1[0]+1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time5 = %llu\n", time2 - time1);
    }
    printf("\n");

    // half scalar
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        for (int i = 0; i < 1000; i++)
            v3 = _mm256_load_si256((__m256i*) &array1[0]);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time6 = %llu\n", time2 - time1);
    }
    printf("\n");

    // single op
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    uint64_t tmp = 0;
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    for (int j = 0; j < 5; j++) {
        tmp = 0;
        for (int i = 0; i < 10; i++) {
            for (int k = 0; k < 64; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_load_si256((__m256i*) &array1[0]);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1;
        }
            
        printf("Time7 = %llu\n", tmp);
    }
    printf("\n");

    // single op
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    for (int j = 0; j < 5; j++) {
        tmp = 0;
        for (int i = 0; i < 10; i++) {
            for (int k = 0; k < 64; k++)
                _mm_clflush((void*)&array1[k]+1);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_load_si256((__m256i*) &array1[0]+1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1;
        }
            
        printf("Time8 = %llu\n", tmp);
    }
    printf("\n");

    // half scalar gather
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        //for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time4 = %llu\n", time2 - time1);
    }
    printf("\n");

    // half scalar gather
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 221);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        //for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1+1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time4 = %llu\n", time2 - time1);
    }
    printf("\n");

    // half scalar gather
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 2221);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        //for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1+1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time4 = %llu\n", time2 - time1);
    }
    printf("\n");
}

void alignment3() {
    /*
    *  0,  1,  2,  3,  4,  5,  6,  7 con, 1tc
    * 12, 13, 14, 15, 16, 17, 18, 19 con, 2tc
    * 12, 14, 16, 18, 20, 22, 24, 26 non, 2tc
    * 12, 14, 16, 18, 32, 34, 48, 50 non, 4tc
    * non, 8tc
    */
    pfc_reset();
    int vindex[65], junk;
    uint64_t time1, time2, time3, time4, time5, res;
    junk = 0;
    
    for (int i = 0; i < 4096; i++) {
        array1[i] = i + 1; // init
    }

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time1 = %llu\n", time2 - time1);
    }
    printf("Time1 = %llu\n\n", res);
    pfc_print();

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(12, 13, 14, 15, 16, 17, 18, 19);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time2 = %llu\n", time2 - time1);
    }
    printf("Time2 = %llu\n\n", res);
    pfc_print();

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(12, 14, 16, 18, 20, 22, 24, 26);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time3 = %llu\n", time2 - time1);
    }
    printf("Time3 = %llu\n\n", res);
    pfc_print();

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(12, 14, 16, 18, 32, 34, 48, 50);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time4 = %llu\n", time2 - time1);
    }
    printf("Time4 = %llu\n\n", res);
    pfc_print();

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(1, 16, 33, 55, 77, 88, 99, 112);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time5 = %llu\n", time2 - time1);
    }
    printf("Time5 = %llu\n\n", res);
    pfc_print();

    /*
    * faraway test
    */

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(1, 16, 33, 55, 77, 88, 99, 1112);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time5 = %llu\n", time2 - time1);
    }
    printf("Time6 = %llu\n\n", res);
    pfc_print();

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(1, 160, 333, 555, 777, 888, 999, 4112);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_i32gather_epi32(array1, v1, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time5 = %llu\n", time2 - time1);
    }
    printf("Time7 = %llu\n\n", res);
    pfc_print();
}

void alignment4() {
    for (int i = 0; i < 4096; i++) {
        array1[i] = i + 1; // init
    }
    v2 = _mm256_set_epi32(1, 2, 3, 4, 5, 6, 7, 8);
    int vindex[65], junk;
    uint64_t time1, time2, time3, time4, time5, res;
    junk = 0;
    // half scalar gather
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 2221);
    for (int j = 0; j < 5; j++) {
        time1 = __rdtscp((uint32_t *)(&junk));
        //for (int i = 0; i < 1000; i++)
            v3 = _mm256_i32gather_epi32(array1, v1, 1);
        time2 = __rdtscp((uint32_t *)(&junk));
        printf("Time1 = %llu\n", time2 - time1);
    }
    printf("\n");

    // single op
    _mm256_store_si256((__m256i*) &array1[0], v2);
    _mm256_store_si256((__m256i*) &array1[8], v2);
    v1 = _mm256_set_epi32(4, 5, 6, 7, 8, 9, 10, 11);
    uint64_t tmp = 0;
    for (int j = 0; j < 1; j++) {
        tmp = 0;
        for (int i = 0; i < 10000; i++) {
            for (int k = 0; k < 64; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_load_si256((__m256i*) &array1[0]);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1;
        }
            
        printf("Time8 = %llu\n", tmp);
    }
    printf("\n");

    for (int i = 0; i < 4096; i++) {
        _mm_clflush((void*)&array1[i]);
    }

    v1 = _mm256_set_epi32(1, 160, 333, 555, 777, 888, 999, 4112);
    res = 0;
    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        for (int i = 0; i < 10000; i++) {   
            for (int k = 0; k < 4096; k+=16) {
                _mm_clflush((void*)&array1[k]);
            }
            time1 = __rdtscp((uint32_t *)(&junk));
            //for (int i = 0; i < 1000; i++)
                v3 = _mm256_load_si256((__m256i*) &array1[0]+2);
            time2 = __rdtscp((uint32_t *)(&junk));
            res += time2 - time1;    
        }
        PFC_TOC;
        asm volatile("CPUID");
        //printf("Time5 = %llu\n", time2 - time1);
    }
    printf("Time7 = %llu\n\n", res);
    pfc_print();

    int output[100];
    _mm256_storeu_si256((__m256i*) &output[0], v3);
    for (int i = 0; i < 8; i++)
        printf("%d\n", output[i]);
}

void alignment5() {
    /*
    * _mm256_load_si256
    * _mm256_loadu_si256 - 32 alignment
    * _mm256_loadu_si256 - non alignment 1 cache line
    * _mm256_loadu_si256 - non alignment 2 cache line
    * _mm256_i32gather_epi32
    */
    for (int i = 0; i < 4096; i++) {
        array1[i] = i + 1; // init
    }
    v2 = _mm256_set_epi32(1, 2, 3, 4, 5, 6, 7, 8);
    int vindex[65], junk;
    uint64_t time1, time2, time3, time4, time5, res, time0;
    junk = 0;

    time1 = __rdtscp((uint32_t *)(&junk));
    time2 = __rdtscp((uint32_t *)(&junk));
    time0 = time2 - time1;

    pfc_reset();
    uint64_t tmp = 0;
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_load_si256((__m256i*) &array1[0]);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time1 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_loadu_si256((__m256i*) &array1[0]);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time2 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_loadu_si256((__m256i*) &array1[12]);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time3 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(0, 1, 2, 3, 4, 5, 6, 7);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time4 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(12, 13, 14, 15, 16, 17, 18, 19);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time5 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(0, 2, 4, 6, 8, 10, 12, 14);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time6 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(10, 12, 14, 16, 18, 20, 22, 24);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time7 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(12, 14, 16, 18, 28, 30, 32, 34);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time8 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(1, 18, 36, 58, 68, 90, 102, 124);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time9 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();

    pfc_reset();
    v2 = _mm256_set_epi32(1, 18, 36, 58, 68, 90, 102, 924);
    for (int j = 0; j < 1; j++) {
        asm volatile("CPUID");
        PFC_TIC;
        tmp = 0;
        for (int i = 0; i < 1000000; i++) {
            for (int k = 0; k < 1000; k++)
                _mm_clflush((void*)&array1[k]);
            time1 = __rdtscp((uint32_t *)(&junk));
            v3 = _mm256_i32gather_epi32(array1, v2, 1);
            time2 = __rdtscp((uint32_t *)(&junk));
            tmp += time2 - time1 - time0;
        }
        PFC_TOC;
        asm volatile("CPUID");
        printf("Time10 = %llu\n", tmp);
    }
    printf("\n");
    pfc_print();
}

void all_test() {
    ;
}

void mshr() {
    int A, x, y;
    int i, j;
    // for (i = 0; i < 200005; i++)
    //     array2[i] = i;
    // for (i = 0; i < 200005; i++)
    //     _mm_clflush(&array2[i]);
    // for (i = 0; i < 64; i++)
    //     array3[i] = i;
    // for (i = 0; i < 64; i++)
    //     _mm_clflush(&array3[i]);
    uint64_t time1, time2, time3 = 0;
    unsigned int junk = 0;
    vi0 = _mm256_set_epi32(0, 1, 2, 3, 4, 5, 6, 7);
    vi1 = _mm256_set_epi32(8, 9, 10, 11, 12, 13, 14, 15);
    vi2 = _mm256_set_epi32(512, 1513, 514, 515, 516, 517, 6518, 7519);
    // _mm_mfence();
    // for (i = 0; i < 1000; i++) {
    //     for (j = 0; j < 16; j++)
    //         _mm_clflush(&array2[j]);
    //     _mm_mfence();
    //     time1 = __rdtscp(&junk);
    //     v0 = _mm256_i32gather_epi32(array2, vi0, 1);
    //     v1 = _mm256_i32gather_epi32(array2, vi1, 1);
    //     _mm_mfence();
    //     time2 = __rdtscp(&junk) - time1;
    //     time3 += time2;
    // }
    pfc_reset();
    PFC_TIC;
    _mm_mfence();
    time1 = __rdtscp(&junk);
    // v0 = _mm256_i32gather_epi32(array2, vi0, 1);
    // v1 = _mm256_i32gather_epi32(array2, vi1, 1);
    // v2 = _mm256_i32gather_epi32(array2, vi2, 1);
    v0 = _mm256_load_si256((__m256i*) &array2[199992]);
    // v1 = _mm256_load_si256((__m256i*) &array2[512]);
    _mm_mfence();
    time2 = __rdtscp(&junk) - time1;
    time3 += time2;
    PFC_TOC;
    pfc_print();
    printf("%lu\n%lu\n", time2, time3);

    // int tmp[100];
    // memset(tmp, 0, sizeof(tmp));
    // _mm256_store_si256((__m256i*) &tmp[0], v0);
    // for (i = 0; i < 8; i++)
    //     printf("%d\n", tmp[i]);
}

void run_victim(size_t malicious_x) {
    pfc_reset();

    /*char result[1025];
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

    pfc_print();*/
    mshr();
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

    printf("\n");
    printf("%d\n", &array1[0]);
    printf("%d\n", &array1[1]);

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

// g++ alignment.cpp pfc.cpp -o alignment -no-pie