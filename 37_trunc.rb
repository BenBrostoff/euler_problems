require_relative '7_10001_prime.rb'
require 'Prime'

def check_trunc(num)
  num_array, hold = num.to_s.split(""), []
  num_array.each_with_index do |dig, index|
    hold << num_array[index..-1].join("").to_i
    hold << num_array[0..index].join("").to_i 
  end
  final = hold.uniq
  return final == final.select { |x| Prime.prime?(x) }
end

def check_pre_req(num)
  num.to_s.split("").each_with_index do |dig, index|
    return false if (dig % 2 == 0 || dig == 5) && index != 0
  end
  return true
end

def narrow(array)
  array.find_all { |x| check_pre_req(x) == true && x >= 11 }
end

def solve
  check, hold = narrow(eratosthenes(1000000)), []
  check.each do |prime|
    hold << prime if check_trunc(prime)
    break if hold.length == 11
  end
  hold.inject{|sum,n| sum += n }
end

p solve

