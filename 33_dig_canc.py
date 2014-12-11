from operator import mul
from fractions import Fraction

def value_frac(num_1, num_2):
    return float(num_1) / float(num_2)

def digitfy(num):
    digs = list(str(num))
    return [int(x) for x in digs]

def section(dig_1, dig_2):
    return list(set(dig_1) & set(dig_2))

def check(num_1, num_2):
    val = value_frac(num_1, num_2)
    dig_1, dig_2 = digitfy(num_1), digitfy(num_2)
    sect = section(dig_1, dig_2)
    if len(sect) == 1 and val == cancel_val(dig_1, dig_2, sect[0]):
        return True if sect[0] != 0 else False

def cancel_val(val_1, val_2, common):
    val_1.remove(common)
    val_2.remove(common)
    return float(val_1[0]) / float(val_2[0]) if val_2[0] != 0 else None

def solve():
    hold = []
    for num_1 in xrange(10, 99):
        for num_2 in xrange(11, 99):
            if check(num_1, num_2) and num_1 != num_2:
                hold.append(value_frac(num_1, num_2))
                if len(hold) == 4:
                    dec = reduce(mul, hold, 1)
                    return Fraction(dec).limit_denominator()

print solve()
