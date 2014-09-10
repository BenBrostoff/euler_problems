require_relative "words.rb"
require_relative "../22_names_scores/22.rb"

def is_triangle?(num)
  tri = []
  (1.. 26 * 50).to_a.each { |num| tri << (num * (num + 1)) / 2 }
  tri.include?(num)
end

def solve 
  sum = 0
  WORDS.each { |word| sum += 1 if is_triangle?(letter_val(word)) }
  return sum
end

p solve 

