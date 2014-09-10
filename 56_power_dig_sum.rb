require_relative '29_distinct_powers.rb'

def sum_dig(num)
  num = num.to_s.split("").map { |x| x.to_i }
  num.inject { |sum, x| sum += x }
end

def solve
  final = []
  dist_pow(50,100,50,100).each do |num|
    final << [num, sum_dig(num)]
  end
  return final.sort_by{|x| x[1]}[-1][1]
end

p solve

