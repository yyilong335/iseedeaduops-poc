import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import MultipleLocator

# x-axis
plotx_list = np.arange(0, 38)
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
PCD101 = [ 12,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  41,  43,  45,  47,  49,  51,  53,  55,  57]
PCD108 = [  0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12,  12]
PCD140 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,  15,  16,  16,  16,  16,  16,  16,  16,  16,  16,  16]
PC0801 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
Time   = [117, 295, 305, 324, 318, 337, 334, 350, 380, 364, 415, 424, 451, 446, 433, 399, 441, 415, 439, 444, 437, 439, 414, 432, 418, 466, 452, 474, 478, 462, 439, 469, 476, 495, 473, 472, 440, 486]
PC4802 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
PC4C01 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
PC4801 = [  0, 170, 328, 560, 787, 965,1168,1486,1741,2039,2418,2778,2959,2115,3314,3675,2273,2840,3387,2312,4007,3433,3669,3852,4482,4428,3347,4232,3556,4251,3452,5530,4747,6446,2262,4102,4322,4506]
PC4C02 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]

plt.rcParams["font.family"] = "ubuntu"
plt.rcParams["font.size"] = 16
plt.rcParams['font.weight'] = "bold"
plt.rcParams['axes.labelweight'] = "bold"

fig1 = plt.figure(figsize=(8, 4))
ax = plt.axes()

color1 = '#5B84B1FF'
color2 = '#FC766AFF'
color3 = '#8EC260'

ax.plot(plotx_list, PC4801, color=color1, marker='o', ms=7,  mec=color1, mew=1.5, mfc='white', linestyle='-', label='Time')

ax.legend(bbox_to_anchor=(0.014, 1), loc=3, borderaxespad=0, ncol=3, fontsize='small', frameon=False,
               columnspacing=0.5)
ax.set_axisbelow(True)


x_major_locator = MultipleLocator(5)
ax.xaxis.set_major_locator(x_major_locator)
plt.xlabel("Number of Loads")
plt.ylabel("L1D Pend")

plt.savefig('Load-L1DPend.pdf', format='pdf', dpi=1000, bbox_inches='tight')