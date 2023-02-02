#pragma GCC optimize("O0","unroll-loops","omit-frame-pointer","inline") //Optimization flags
// #pragma GCC target("avx", "avx2")  //Enable AVX
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <string.h>
#include <immintrin.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include "pfc.h"
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt", on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif
#define CPUID() asm volatile ("CPUID" : : : "%rax", "%rbx", "%rcx", "%rdx");
__attribute__((optimize("no-tree-vectorize"))) //Force disable auto-vectorization

__m256i v0, v1, v2, v3;
__m256i vi0, vi1, vi2, vi3;
unsigned int array1_size = 16;
uint8_t unused1[64];
uint8_t array1[160] = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16};
uint8_t unused2[64];
uint8_t array2[256 * 512];

char secret[1001];

uint8_t array3[200000];

uint8_t A, y;
uint64_t a0, a1;
size_t delta;

void generateSecret()
{
    /*
    * generate secret bit by bit
    * generate array3 with random number to craft stall
    */
    srand(time(0));
    int i;
    for (i = 0; i < 1000; i++)
        secret[i] = rand() & 1;
    secret[0] = 0;
    // for (i = 0; i < 120; i++)
    //     printf("*");
    // printf("\nSecret: \n");
    // for (i = 0; i < 100; i++)
    //     printf("%d", secret[i]);
    // printf("\n");
    // for (i = 0; i < 120; i++)
    //     printf("*");
    
    for (i = 0; i < 200000; i++)
    {
        array3[i] = ((rand() % 32768) * rand()) % 200000;
    }
}

void lfb_test()
{
    printf("======125 Access======\n\n");
    unsigned int junk = 0;
    uint64_t time1, time2, time3 = 0, time4;
    int i, j;
    register uint8_t temp = 0; /* Used so compiler won’t optimize out victim_function() */

    // uint8_t x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20;
    for (i = 0; i < 5; i++)
    {
        for (j = 0; j <= 2048; j++)
        {
            _mm_clflush(&array2[16 * j]);
            _mm_clflush(&array2[16 * j + 1]);
        }
        pfc_reset();
        PFC_TIC;
        _mm_lfence();
        time1 = _rdtscp(&junk);
        asm volatile(
            ".intel_syntax noprefix     \n"
            "push rdx   \n"
            // "push r15   \n"
            // "mov r15, array2            \n"
            "mov rdx, [array2 + 0x0]           \n"
            "mov rdx, [array2 + 0x10]    \n"
            "mov rdx, [array2 + 0x20]    \n"
            "mov rdx, [array2 + 0x30]    \n"
            "mov rdx, [array2 + 0x40]    \n"
            "mov rdx, [array2 + 0x50]    \n"
            "mov rdx, [array2 + 0x60]    \n"
            "mov rdx, [array2 + 0x70]    \n"
            "mov rdx, [array2 + 0x80]    \n"
            "mov rdx, [array2 + 0x90]    \n"
            "mov rdx, [array2 + 0xa0]    \n"
            "mov rdx, [array2 + 0xb0]    \n"
            "mov rdx, [array2 + 0xc0]    \n"
            "mov rdx, [array2 + 0xd0]    \n"
            "mov rdx, [array2 + 0xe0]    \n"
            "mov rdx, [array2 + 0xf0]    \n"
            "mov rdx, [array2 + 0x100]    \n"
            "mov rdx, [array2 + 0x110]    \n"
            "mov rdx, [array2 + 0x120]    \n"
            "mov rdx, [array2 + 0x130]    \n"
            "mov rdx, [array2 + 0x140]    \n"
            "mov rdx, [array2 + 0x150]    \n"
            "mov rdx, [array2 + 0x160]    \n"
            "mov rdx, [array2 + 0x170]    \n"
            "mov rdx, [array2 + 0x180]    \n"
            "mov rdx, [array2 + 0x190]    \n"
            "mov rdx, [array2 + 0x1a0]    \n"
            "mov rdx, [array2 + 0x1b0]    \n"
            "mov rdx, [array2 + 0x1c0]    \n"
            "mov rdx, [array2 + 0x1d0]    \n"
            "mov rdx, [array2 + 0x1e0]    \n"
            "mov rdx, [array2 + 0x1f0]    \n"
            "mov rdx, [array2 + 0x200]    \n"
            "mov rdx, [array2 + 0x210]    \n"
            "mov rdx, [array2 + 0x220]    \n"
            "mov rdx, [array2 + 0x230]    \n"
            "mov rdx, [array2 + 0x240]    \n"
            "mov rdx, [array2 + 0x250]    \n"
            "mov rdx, [array2 + 0x260]    \n"
            "mov rdx, [array2 + 0x270]    \n"
            "mov rdx, [array2 + 0x280]    \n"
            "mov rdx, [array2 + 0x290]    \n"
            "mov rdx, [array2 + 0x2a0]    \n"
            "mov rdx, [array2 + 0x2b0]    \n"
            "mov rdx, [array2 + 0x2c0]    \n"
            "mov rdx, [array2 + 0x2d0]    \n"
            "mov rdx, [array2 + 0x2e0]    \n"
            "mov rdx, [array2 + 0x2f0]    \n"
            "mov rdx, [array2 + 0x300]    \n"
            "mov rdx, [array2 + 0x310]    \n"
            "mov rdx, [array2 + 0x320]    \n"
            "mov rdx, [array2 + 0x330]    \n"
            "mov rdx, [array2 + 0x340]    \n"
            "mov rdx, [array2 + 0x350]    \n"
            "mov rdx, [array2 + 0x360]    \n"
            "mov rdx, [array2 + 0x370]    \n"
            "mov rdx, [array2 + 0x380]    \n"
            "mov rdx, [array2 + 0x390]    \n"
            "mov rdx, [array2 + 0x3a0]    \n"
            "mov rdx, [array2 + 0x3b0]    \n"
            "mov rdx, [array2 + 0x3c0]    \n"
            "mov rdx, [array2 + 0x3d0]    \n"
            "mov rdx, [array2 + 0x3e0]    \n"
            "mov rdx, [array2 + 0x3f0]    \n"
            "mov rdx, [array2 + 0x400]    \n"
            "mov rdx, [array2 + 0x410]    \n"
            "mov rdx, [array2 + 0x420]    \n"
            "mov rdx, [array2 + 0x430]    \n"
            "mov rdx, [array2 + 0x440]    \n"
            "mov rdx, [array2 + 0x450]    \n"
            "mov rdx, [array2 + 0x460]    \n"
            "mov rdx, [array2 + 0x470]    \n"
            "mov rdx, [array2 + 0x480]    \n"
            "mov rdx, [array2 + 0x490]    \n"
            "mov rdx, [array2 + 0x4a0]    \n"
            "mov rdx, [array2 + 0x4b0]    \n"
            "mov rdx, [array2 + 0x4c0]    \n"
            "mov rdx, [array2 + 0x4d0]    \n"
            "mov rdx, [array2 + 0x4e0]    \n"
            "mov rdx, [array2 + 0x4f0]    \n"
            "mov rdx, [array2 + 0x500]    \n"
            "mov rdx, [array2 + 0x510]    \n"
            "mov rdx, [array2 + 0x520]    \n"
            "mov rdx, [array2 + 0x530]    \n"
            "mov rdx, [array2 + 0x540]    \n"
            "mov rdx, [array2 + 0x550]    \n"
            "mov rdx, [array2 + 0x560]    \n"
            "mov rdx, [array2 + 0x570]    \n"
            "mov rdx, [array2 + 0x580]    \n"
            "mov rdx, [array2 + 0x590]    \n"
            "mov rdx, [array2 + 0x5a0]    \n"
            "mov rdx, [array2 + 0x5b0]    \n"
            "mov rdx, [array2 + 0x5c0]    \n"
            "mov rdx, [array2 + 0x5d0]    \n"
            "mov rdx, [array2 + 0x5e0]    \n"
            "mov rdx, [array2 + 0x5f0]    \n"
            "mov rdx, [array2 + 0x600]    \n"
            "mov rdx, [array2 + 0x610]    \n"
            "mov rdx, [array2 + 0x620]    \n"
            "mov rdx, [array2 + 0x630]    \n"
            "mov rdx, [array2 + 0x640]    \n"
            "mov rdx, [array2 + 0x650]    \n"
            "mov rdx, [array2 + 0x660]    \n"
            "mov rdx, [array2 + 0x670]    \n"
            "mov rdx, [array2 + 0x680]    \n"
            "mov rdx, [array2 + 0x690]    \n"
            "mov rdx, [array2 + 0x6a0]    \n"
            "mov rdx, [array2 + 0x6b0]    \n"
            "mov rdx, [array2 + 0x6c0]    \n"
            "mov rdx, [array2 + 0x6d0]    \n"
            "mov rdx, [array2 + 0x6e0]    \n"
            "mov rdx, [array2 + 0x6f0]    \n"
            "mov rdx, [array2 + 0x700]    \n"
            "mov rdx, [array2 + 0x710]    \n"
            "mov rdx, [array2 + 0x720]    \n"
            "mov rdx, [array2 + 0x730]    \n"
            "mov rdx, [array2 + 0x740]    \n"
            "mov rdx, [array2 + 0x750]    \n"
            "mov rdx, [array2 + 0x760]    \n"
            "mov rdx, [array2 + 0x770]    \n"
            "mov rdx, [array2 + 0x780]    \n"
            "mov rdx, [array2 + 0x790]    \n"
            "mov rdx, [array2 + 0x7a0]    \n"
            "mov rdx, [array2 + 0x7b0]    \n"
            "mov rdx, [array2 + 0x7c0]    \n"
            // "mov rdx, [array2 + 0x7d0]    \n"
            // "mov rdx, [array2 + 0x7e0]    \n"
            // "mov rdx, [array2 + 0x7f0]    \n"
            // "pop r15     \n"
            "pop rdx    \n"
            ".att_syntax noprefix"
        );
        // temp = 1;
        // uint8_t x0 = array2[temp * 512 * 0];
        // uint8_t x1 = array2[temp * 512 * 1];
        // uint8_t x2 = array2[temp * 512 * 2];
        // uint8_t x3 = array2[temp * 512 * 3];
        // uint8_t x4 = array2[temp * 512 * 4];
        // uint8_t x5 = array2[temp * 512 * 5];
        // uint8_t x6 = array2[temp * 512 * 6];
        // uint8_t x7 = array2[temp * 512 * 7];
        // uint8_t x8 = array2[temp * 512 * 8];
        // uint8_t x9 = array2[temp * 512 * 9];
        // uint8_t x10 = array2[temp * 512 * 10];
        // uint8_t x11 = array2[temp * 512 * 11];
        // uint8_t x12 = array2[temp * 512 * 12];
        // uint8_t x13 = array2[temp * 512 * 13];
        // uint8_t x14 = array2[temp * 512 * 14];
        // uint8_t x15 = array2[temp * 512 * 15];
        // uint8_t x16 = array2[temp * 512 * 16];
        // uint8_t x17 = array2[temp * 512 * 17];
        // uint8_t x18 = array2[temp * 512 * 18];
        // uint8_t x19 = array2[temp * 512 * 19];
        // uint8_t x20 = array2[temp * 512 * 20];
        // uint8_t x21 = array2[temp * 512 * 21];
        // uint8_t x22 = array2[temp * 512 * 22];
        // uint8_t x23 = array2[temp * 512 * 23];
        // uint8_t x24 = array2[temp * 512 * 24];
        // uint8_t x25 = array2[temp * 512 * 25];
        // uint8_t x26 = array2[temp * 512 * 26];
        // uint8_t x27 = array2[temp * 512 * 27];
        // uint8_t x28 = array2[temp * 512 * 28];
        // uint8_t x29 = array2[temp * 512 * 29];
        // uint8_t x30 = array2[temp * 512 * 30];
        // uint8_t x31 = array2[temp * 512 * 31];
        // uint8_t x32 = array2[temp * 512 * 512];
        // uint8_t x33 = array2[temp * 512 * 33];
        // uint8_t x34 = array2[temp * 512 * 34];
        // uint8_t x35 = array2[temp * 512 * 35];
        // uint8_t x36 = array2[temp * 512 * 36];
        // uint8_t x37 = array2[temp * 512 * 37];
        // uint8_t x38 = array2[temp * 512 * 38];
        // uint8_t x39 = array2[temp * 512 * 39];
        // uint8_t x40 = array2[temp * 512 * 40];
        // uint8_t x41 = array2[temp * 512 * 41];
        // uint8_t x42 = array2[temp * 512 * 42];
        // uint8_t x43 = array2[temp * 512 * 43];
        // uint8_t x44 = array2[temp * 512 * 44];
        // uint8_t x45 = array2[temp * 512 * 45];
        // uint8_t x46 = array2[temp * 512 * 46];
        // uint8_t x47 = array2[temp * 512 * 47];
        _mm_lfence();
        time2 = _rdtscp(&junk);
        PFC_TOC;
        printf("Time : %lu\n", time2 - time1);
        pfc_print();
        time3 += time2 - time1;
        // printf("x0 : %d\nx1 : %d\n", x0, x1);
    }
    time3 /= 5;
    printf("Avg Time : %lu\n\n\n", time3);
}

int main()
{
    pfc_setup();
    _mm_mfence();
    unsigned int junk = 0;
    // register uint64_t time1, time2, time3, time4;
    int i, j;

    generateSecret();
    for (i = 0; i < 200000; i+=64)
    {
        _mm_clflush(&array3[i]);
        _mm_clflush(&array3[i+1]);
    }

    lfb_test();
    return 0;
}

// g++ lfb.cpp pfc.cpp -o lfb -no-pie