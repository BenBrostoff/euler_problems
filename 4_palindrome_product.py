def palindrome_check(num):
  return str(num)[::-1] == str(num)

def factor_check(num):
  for divisor in range(100, 1000):
    if num / divisor >= 100 and num / divisor < 1000 and num % divisor == 0:
      return True

def largest_pal_product():
  lst = []
  for num in range(100 * 100, 999 * 999):
    if palindrome_check(num) == True and factor_check(num) == True:
      lst.append(num)
  return max(lst)

print largest_pal_product()