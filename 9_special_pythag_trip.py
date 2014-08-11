import math

def py_check(a, b, c):
  if a**2 + b**2 == c**2 and a < b < c and a + b + c == 1000:
    return True

def special_py():
  a, b, c = 0, 0, 0
  for b_set in range(1, 1000):
    b = b_set
    for a_set in range(1, b + 1):
      a = a_set
      c = math.sqrt(a ** 2 + b ** 2)
      if py_check(a,b,c) == True:
        return a * b * c

print special_py()


