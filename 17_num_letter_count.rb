KEY = {0=> "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six",
       7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
       13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 
       18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty",
       50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 1000 => "onethousand"}

LOG = {1=> "", 2 => "hundred", 3 => "thousand"}

def log(num)
  Math.log10(num).floor
end

def power(num)
  return (num / (10 ** (log(num)))) if num >= 100
  return (num / 10) * 10 if num < 100
end

def num_to_word(num) 
  return KEY[num] if KEY.keys.include?(num)

  word = []
  if num > 100 && num % 100 != 0
    word << KEY[power(num)] << LOG[log(num)] << "and" << num_to_word(num % 10 ** log(num)) 
  else 
    word << KEY[power(num)] << LOG[log(num)] << num_to_word(num % 10 ** log(num)) 
  end
  word.join("") 
end

def solve
  count = 0
  (1..1000).to_a.each do |num|
      count += num_to_word(num).length
    end
  return count
end


print solve 

