def parse(file)
  array = []
  file = File.new(file, "r")
  while (line = file.gets)
    array << line.split(" ").map {|x| x.to_i}
  end
  return array
end

def shorten_by_one(array) 
  shortened = []
  array.each_with_index do |num, index|
    shortened << [num, array[index + 1]].max if index < array.length - 1
  end
  return shortened
end

def add_arrays(array_1, array_2)
  combined = []
  (0... array_1.length).to_a.each {|x| combined << array_1[x] + array_2[x]}
  return combined
end

def path(file) 
  invert_tri = parse(file).reverse #work from bottom up 
  p invert_tri.length
  invert_tri.each_with_index do |row, index|
    if index < invert_tri.length - 1
      # set current index to array reflective of maximized sums
      invert_tri[index] = shorten_by_one(invert_tri[index])
      # combine with next array 
      invert_tri[index + 1] = add_arrays(invert_tri[index], invert_tri[index + 1])
    end
  end
  p invert_tri.length
  return invert_tri[-1]
end 

puts path("18_tri.txt")
puts path("67_tri.txt")



