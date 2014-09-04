def change_combos(target, vals)
  ways = [1] + [0] * target
  vals.each do |val|
    (val.. target).each do |x|
        ways[x] += ways[x-val]
      end
  end
  return ways[target]
end

p change_combos(200, [1, 2, 5, 10, 20, 50, 100, 200])


