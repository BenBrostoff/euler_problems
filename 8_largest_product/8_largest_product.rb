require_relative '8_raw_data'

def array_creator
  i, temp, test_ground = 0, [], []
  NUMBERS.split("").each do |number|
    break if number == NUMBERS.length - 13
    i += 1
    (0..12).to_a.each do |element|
      temp << NUMBERS[i + element].to_i
    end
    test_ground << temp
    temp = []
  end
  return test_ground
end

def product_test(array)
  product = []
  array.each do |series|
    product <<  series.inject{|sum, n| sum * n}
  end
  return product.max
end

p product_test(array_creator)