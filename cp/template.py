import sys
from collections import defaultdict, deque, Counter
from heapq import heappush, heappop, heapify
from bisect import bisect_left, bisect_right
from itertools import accumulate, permutations, combinations
from math import gcd, inf
try:
    from math import isqrt  # Python 3.8+
except ImportError:
    def isqrt(n):
        if n < 0:
            raise ValueError("isqrt() argument must be nonnegative")
        if n == 0:
            return 0
        x = 1 << ((n.bit_length() + 1) >> 1)
        while True:
            y = (x + n // x) >> 1
            if y >= x:
                return x
            x = y
input = sys.stdin.readline

def dbg(*a):
    if __debug__ and 'LOCAL' in sys.argv[1:]:
        print(*a, file=sys.stderr)

def solve():
    pass

def main():
    t = 1
    # t = int(input())
    for _ in range(t):
        solve()

main()
