import math

def log_two(num):
    return int(math.log(num, 2))

def power_two(num):
    return 2 ** num

def to_bin(num):
    if num == 0:
        return 0
    if num == 1:
        return 1
    digs = log_two(num)
    bin = 10 ** digs 
    rem = num - 2 ** digs
    return bin + to_bin(rem)

def from_bin(bin):
    digs = len(str(bin))
    base = power_two(digs -1)
    next_dig = digs - 1
    for x in str(bin)[1:]:
        next_dig -= 1
        if int(x) == 1:
            base += power_two(next_dig) 
    return base

