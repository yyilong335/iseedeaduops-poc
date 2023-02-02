import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import MultipleLocator

# x-axis
plotx_list = np.arange(0, 49)
#print(x)

# performance counter
# D1.01 MEM_LOAD_RETIRED.L1_HIT
# D1.08 MEM_LOAD_RETIRED.L1_MISS
# D1.40 MEM_LOAD_RETIRED.FB_HIT
# 08.01 DTLB_LOAD_MISSES.MISS_CAUSES_A_WALK
# 48.02 L1D_PEND_MISS.FB_FULL
# 4C.01 LOAD_HIT_PRE.SW_PF
# 4C.02 LOAD_HIT_PRE.HW_PF
# 24.D8 L2_RQSTS.PF_HIT
# 48.01 L1D_PEND_MISS.PENDING

# lfb experiment
# 1 cache line, increase 1, non-vectorized, non-speculative
# unstable at x27
# L1_MISS shows misses in every level of caches
PC4802_256    = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   6,  13,  22,  32,  41,  52,  62,  73,  89,  94, 106, 109, 117, 113, 115, 134, 117, 117, 136, 128, 139, 144, 156, 166, 150, 173, 175, 188, 173, 168, 173, 171, 165, 187, 164, 181]
plotx_list_16 = [0, 40, 43, 44, 48, 49, 50, 52, 56, 64, 65, 72, 80, 81, 88, 96, 104, 112, 120, 128]
PC4802_16     = [0,  0,  0,  1,  1,  2,  2,  2,  3,  5,  7,  7,  7,  7,  9, 10,  12,  17,  18,  20]
plotx_list_lfence_16 = [0, 40, 44, 48, 52, 56, 64, 68, 69, 72, 80, 88, 96, 104, 112, 120, 124, 128]
PC4802_lfence_16     = [0,  0,  1,  2,  6,  8, 10, 12, 15, 20, 26, 24, 28,  30,  32,  36,  41,  56]
PCD140 = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,  15,  16,  16,  16,  16,  16,  16,  16,  16,  16,  16]
PCD108 = [   0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12]
PCD101 = [  12,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  41,  43,  45,  47,  49,  51,  53,  55,  57]
Time_256      = [1398,1634,1681,1737,1724,1768,1796,1696,1757,1763,1945,1902,1871,1852,1948,1900,1913,4696,2179,1946,2085,2016,2004,2063,1990,2093,2118,2048,2041,2186,1994,2050,2170,2057,2025,2157,2224,2003,2007,2094,2020,1956,2071,2193,2118,2028,2126]

#PC0801 = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
#PC4C01 = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
#PC4801 = [   0, 170, 328, 560, 787, 965,1168,1486,1741,2039,2418,2778,2959,2115,3314,3675,2273,2840,3387,2312,4007,3433,3669,3852,4482,4428,3347,4232,3556,4251,3452,5530,4747,6446,2262,4102,4322,4506]
#PC4C02 = [   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]

plt.rcParams["font.family"] = "ubuntu"
plt.rcParams["font.size"] = 16
plt.rcParams['font.weight'] = "bold"
plt.rcParams['axes.labelweight'] = "bold"

fig1 = plt.figure(figsize=(8, 4))
ax = plt.axes()

color1 = '#5B84B1FF'
color2 = '#FC766AFF'
color3 = '#8EC260'

ax.plot(plotx_list_lfence_16, PC4802_lfence_16, color=color1, marker='o', ms=7,  mec=color1, mew=1.5, mfc='white', linestyle='-', label='Time')

ax.legend(bbox_to_anchor=(0.014, 1), loc=3, borderaxespad=0, ncol=3, fontsize='small', frameon=False,
               columnspacing=0.5)
ax.set_axisbelow(True)


x_major_locator = MultipleLocator(10)
ax.xaxis.set_major_locator(x_major_locator)
plt.xlabel("Num of Load Inst")
plt.ylabel("FB_FULL_lfence_16")

plt.savefig('FB_FULL_lfence_16.pdf', format='pdf', dpi=1000, bbox_inches='tight')