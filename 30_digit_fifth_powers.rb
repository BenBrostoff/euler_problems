def split_num_power(num, power)
  digits = num.to_s.split("")
  digits.map { |dig| dig.to_i ** power }
end

def solve(bound)
  solution = []
  (2..bound).to_a.each do |num|
    solution << num if num == split_num_power(num, 5).each.inject{ |sum, n| sum + n }
  end
  solution.each.inject { |sum, n| sum + n }
end

p solve(6 * (9 ** 5))

