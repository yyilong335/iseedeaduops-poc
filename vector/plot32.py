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
PCD101 = [ 12,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37]
PC4801 = [  0, 156, 167, 269, 304, 456, 472, 546, 569, 695, 755,1096, 979,1169,1303,1275,1196,1337,1449,1490,1518,1710,1821,2538,2321,2313,1903]
PCD140 = [  0,   0,   1,   1,   2,   2,   3,   3,   4,   4,   5,   5,   6,   6,   7,   7,   8,   8,   9,   9,  10,  10,  11,  11,  12,  12,  13]
PCD108 = [  0,   1,   1,   2,   2,   3,   3,   4,   4,   5,   5,   6,   6,   7,   7,   8,   8,   9,   9,  10,  10,  11,  11,  12,  12,  13,  13]
#PC0801 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
Time   = [118, 298, 308, 310, 331, 334, 350, 350, 332, 332, 376, 398, 353, 388, 391, 394, 411, 404, 424, 399, 432, 409, 450, 526, 470, 441, 446]
#PC4802 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
#PC4C01 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]
#PC4C02 = [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0]

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