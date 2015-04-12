from itertools import permutations as perm

def solve(dig, num):
  x = list(perm(xrange(0,dig)))[num]
  x = [str(x) for x in x]
  return "".join(x)

print solve(10, 999999)