def change_combos(target, vals)
  # initialize array
  # start w/ 1 as x/x = 1
  ways = [1] + [0] * target
  vals.each do |val|
    # attempt each coin value
    (val.. target).each do |x|
        # sum smaller combos & leverage previous answers
        ways[x] += ways[x - val]
      end
  end
  p ways
  return ways[target]
end

p change_combos(200, [1, 2, 5, 10, 20, 50, 100, 200])


