
import math 
from collections import Counter

def tri_build():
  tri_all = []
  a, b, c = 0, 0, 0
  for b_set in range(1, 1000):
    b = b_set
    for a_set in range(1, b + 1):
      a = a_set
      c = math.sqrt(a ** 2 + b ** 2)
      if c.is_integer():
        tri_all.append([a,b,c])
  return tri_all

def tri_freq():
  perim = []
  for tri in tri_build():
    perim.append(sum(tri))
  freq = Counter([x for x in perim if x <= 1000])
  return freq.most_common(1)

print tri_freq()

        