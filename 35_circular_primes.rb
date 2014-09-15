require_relative '7_10001_prime.rb'


def dig_array(num)
  num.to_s.split("").map { |x| x.to_i }
end

def build_circular(num)
  circular, digits, current = [], dig_array(num), dig_array(num)
  digits.each_with_index do |digit, index|
    circular << (current << digit)[index ... -1].join("").to_i 
  end
  return circular
end

def is_circular?(num, array)
  return false if dig_array(num).select{|x| x % 2 == 0 || x % 5 == 0}.size > 0 && dig_array(num).size > 1
  
  build_circular(num).each do |check|
    return false if !array.include?(check)
  end
  return true
end
  
def solve(array)
  count = 0
  array.each do |prime|
    count += 1 if is_circular?(prime, array)
  end
  return count
end

# p solve(eratosthenes(1000000))

