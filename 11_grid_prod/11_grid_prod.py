from operator import mul

def product_out(list_num):
    return reduce(mul, list_num, 1)

def down_up_left_right(grid, size_x, size_y, num):
    check = []
    for elem in grid:
        for x in xrange(size_x - (num - 1)):
            check.append(product_out(elem[x:x+num]))
    return check

def diag(grid, size_x, size_y, num):
    check, temp = [], []
    for x in xrange(size_x - (num - 1)):
        for y in xrange(size_y - (num - 1)):
            temp = []
            hold_x, hold_y = x, y
            for y in xrange(num):
                temp.append(grid[hold_x][hold_y])
                hold_x, hold_y = hold_x + 1, hold_y + 1
            check.append(product_out(temp))
    return check

def diag_reverse(grid, size_x, size_y, num):
    check, temp = [], []
    for x in xrange(size_x - (num - 1)):
        for y in xrange(size_y - (num - 1)):
            temp = []
            hold_x, hold_y = size_x - (x+1), y
            for y in xrange(num):
                temp.append(grid[hold_x][hold_y])
                hold_x, hold_y = hold_x - 1, hold_y + 1
            check.append(product_out(temp))
    return check

def solve(grid, size_x, size_y, num):
    test = []
    transposed = [list(x) for x in zip(*grid)]
    test.append(down_up_left_right(results, size_x, size_y, num))
    test.append(down_up_left_right(transposed, size_x, size_y, num))
    test.append(diag(results, size_x, size_y, num))
    test.append(diag_reverse(results, size_x, size_y, num))
    test = [item for sublist in test for item in sublist] #flatten
    return max(test)

results = []
with open('11_grid_prod.txt') as inputfile:
    for line in inputfile:
        line = map(lambda x: int(x), line.split())
        results.append(line)

print solve(results, 20, 20, 4)