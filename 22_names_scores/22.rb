require_relative "names.rb"

def hash_key
  num, alpha, key = (1..26).to_a, ("a".."z").to_a, {}
  num.each_with_index{ |num, index| key[alpha[index]] = num }
  return key
end

def letter_val(word)
  sum = 0
  word.downcase.split("").each { |letter| sum += hash_key[letter] }
  return sum
end

def solve
  sum = 0
  NAMES.sort.each_with_index do |name, index|
    sum += (index + 1) * letter_val(name)
  end
  return sum
end

p solve