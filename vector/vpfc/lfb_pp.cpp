#pragma GCC optimize("O0","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC target("avx", "avx2")  //Enable AVX
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

__m256i v0;
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
uint8_t array2[32*32768];
uint8_t array3[32768];

uint8_t A, y;
uint64_t a0, a1;
size_t delta;

void prime() 
{
    for (int i = 0; i < 32 * 32768; i+=64)
    {
        array2[i] = 1;
    }
    for (int i = 0; i < 32768; i+=64)
    {
        array3[i] = 1;
    }
}

void lfb_test()
{
    printf("======32 Access======\n\n");
    unsigned int junk = 0;
    uint64_t time1, time2, time3 = 0, time4;
    int i, j;
    register uint8_t temp = 0; /* Used so compiler won’t optimize out victim_function() */

    // uint8_t x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20;
    for (i = 0; i < 5; i++)
    {
        // for (j = 0; j <= 2048; j++)
        // {
        //     _mm_clflush(&array2[16 * j]);
        //     _mm_clflush(&array2[16 * j + 1]);
        // }
        prime();
        pfc_reset();
        PFC_TIC;
        CPUID();
        time1 = _rdtscp(&junk);
        asm volatile(
            ".intel_syntax noprefix     \n"
            // "push r15   \n"
            // "mov r15, array2            \n"
            // "vpgatherdd %ymm2, [array2 + %ymm1], %ymm0 \n"
            "vmovdqu [array2 + 0x30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x30]           \n"
            "vmovdqu [array2 + 0x130], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x130]    \n"
            "vmovdqu [array2 + 0x230], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x230]    \n"
            "vmovdqu [array2 + 0x330], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x330]    \n"
            "vmovdqu [array2 + 0x430], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x430]    \n"
            "vmovdqu [array2 + 0x530], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x530]    \n"
            "vmovdqu [array2 + 0x630], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x630]    \n"
            "vmovdqu [array2 + 0x730], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x730]    \n"
            "vmovdqu [array2 + 0x830], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x830]    \n"
            "vmovdqu [array2 + 0x930], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x930]    \n"
            "vmovdqu [array2 + 0xa30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xa30]    \n"
            "vmovdqu [array2 + 0xb30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xb30]    \n"
            "vmovdqu [array2 + 0xc30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xc30]    \n"
            "vmovdqu [array2 + 0xd30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xd30]    \n"
            "vmovdqu [array2 + 0xe30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xe30]    \n"
            "vmovdqu [array2 + 0xf30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0xf30]    \n"
            "vmovdqu [array2 + 0x1030], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1030]           \n"
            "vmovdqu [array2 + 0x1130], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1130]    \n"
            "vmovdqu [array2 + 0x1230], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1230]    \n"
            "vmovdqu [array2 + 0x1330], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1330]    \n"
            "vmovdqu [array2 + 0x1430], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1430]    \n"
            "vmovdqu [array2 + 0x1530], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1530]    \n"
            "vmovdqu [array2 + 0x1630], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1630]    \n"
            "vmovdqu [array2 + 0x1730], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1730]    \n"
            "vmovdqu [array2 + 0x1830], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1830]    \n"
            "vmovdqu [array2 + 0x1930], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1930]    \n"
            "vmovdqu [array2 + 0x1a30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1a30]    \n"
            "vmovdqu [array2 + 0x1b30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1b30]    \n"
            "vmovdqu [array2 + 0x1c30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1c30]    \n"
            "vmovdqu [array2 + 0x1d30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1d30]    \n"
            "vmovdqu [array2 + 0x1e30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1e30]    \n"
            "vmovdqu [array2 + 0x1f30], %ymm0 \n"
            "vmovdqu %ymm0, [array2 + 0x1f30]    \n"
            "vmovdqu %ymm0, [array2 + 0x010]           \n"
            // "vmovdqu %ymm0, [array2 + 0x2130]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2230]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2330]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2430]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2530]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2630]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2730]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2830]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2930]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2a30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2b30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2c30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2d30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2e30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x2f30]    \n"
            // "vmovdqu %ymm0, [array2 + 0x300]           \n"
            // "vmovdqu %ymm0, [array2 + 0x310]    \n"
            // "vmovdqu %ymm0, [array2 + 0x320]    \n"
            // "vmovdqu %ymm0, [array2 + 0x330]    \n"
            // "vmovdqu %ymm0, [array2 + 0x340]    \n"
            // "vmovdqu %ymm0, [array2 + 0x350]    \n"
            // "vmovdqu %ymm0, [array2 + 0x360]    \n"
            // "vmovdqu %ymm0, [array2 + 0x370]    \n"
            // "vmovdqu %ymm0, [array2 + 0x380]    \n"
            // "vmovdqu %ymm0, [array2 + 0x390]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3a0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3b0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3c0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3d0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3e0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x3f0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x400]           \n"
            // "vmovdqu %ymm0, [array2 + 0x410]    \n"
            // "vmovdqu %ymm0, [array2 + 0x420]    \n"
            // "vmovdqu %ymm0, [array2 + 0x430]    \n"
            // "vmovdqu %ymm0, [array2 + 0x440]    \n"
            // "vmovdqu %ymm0, [array2 + 0x450]    \n"
            // "vmovdqu %ymm0, [array2 + 0x460]    \n"
            // "vmovdqu %ymm0, [array2 + 0x470]    \n"
            // "vmovdqu %ymm0, [array2 + 0x480]    \n"
            // "vmovdqu %ymm0, [array2 + 0x490]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4a0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4b0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4c0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4d0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4e0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x4f0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x500]           \n"
            // "vmovdqu %ymm0, [array2 + 0x510]    \n"
            // "vmovdqu %ymm0, [array2 + 0x520]    \n"
            // "vmovdqu %ymm0, [array2 + 0x530]    \n"
            // "vmovdqu %ymm0, [array2 + 0x540]    \n"
            // "vmovdqu %ymm0, [array2 + 0x550]    \n"
            // "vmovdqu %ymm0, [array2 + 0x560]    \n"
            // "vmovdqu %ymm0, [array2 + 0x570]    \n"
            // "vmovdqu %ymm0, [array2 + 0x580]    \n"
            // "vmovdqu %ymm0, [array2 + 0x590]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5a0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5b0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5c0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5d0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5e0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x5f0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x600]           \n"
            // "vmovdqu %ymm0, [array2 + 0x610]    \n"
            // "vmovdqu %ymm0, [array2 + 0x620]    \n"
            // "vmovdqu %ymm0, [array2 + 0x630]    \n"
            // "vmovdqu %ymm0, [array2 + 0x640]    \n"
            // "vmovdqu %ymm0, [array2 + 0x650]    \n"
            // "vmovdqu %ymm0, [array2 + 0x660]    \n"
            // "vmovdqu %ymm0, [array2 + 0x670]    \n"
            // "vmovdqu %ymm0, [array2 + 0x680]    \n"
            // "vmovdqu %ymm0, [array2 + 0x690]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6a0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6b0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6c0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6d0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6e0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x6f0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x700]           \n"
            // "vmovdqu %ymm0, [array2 + 0x710]    \n"
            // "vmovdqu %ymm0, [array2 + 0x720]    \n"
            // "vmovdqu %ymm0, [array2 + 0x730]    \n"
            // "vmovdqu %ymm0, [array2 + 0x740]    \n"
            // "vmovdqu %ymm0, [array2 + 0x750]    \n"
            // "vmovdqu %ymm0, [array2 + 0x760]    \n"
            // "vmovdqu %ymm0, [array2 + 0x770]    \n"
            // "vmovdqu %ymm0, [array2 + 0x780]    \n"
            // "vmovdqu %ymm0, [array2 + 0x790]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7a0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7b0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7c0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7d0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7e0]    \n"
            // "vmovdqu %ymm0, [array2 + 0x7f0]    \n"
            // "pop r15     \n"
            // "pop rdx    \n"
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
        CPUID();
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

void init()
{
    v0 = _mm256_set_epi32(0x0, 0x100, 0x200, 0x300, 0x400, 0x500, 0x600, 0x700);
}

void assign_ymm0(__m256i v0)
{
    // __asm__ volatile("vmovdqa %0, %%ymm0" : : "x"(v0));
    __asm__ volatile("vmovupd ymm0, v0");
}

int main()
{
    pfc_setup();
    _mm_mfence();
    init();

    assign_ymm0(v0);

    unsigned int junk = 0;
    // register uint64_t time1, time2, time3, time4;
    int i, j;

    lfb_test();
    return 0;
}

// g++ lfb.cpp pfc.cpp -o lfb -no-pie