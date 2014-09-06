def parse(file)
  array = []
  file = File.new(file, "r")
  while (line = file.gets)
    line = line.split(" ").map {|x| x.to_i}
    array << line
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
  array = parse(file)
  rev = array.reverse
  sum_all = []
  rev.each_with_index do |row, index|
    if index < array.length - 1
      rev[index] = shorten_by_one(rev[index])
      rev[index + 1] = add_arrays(rev[index], rev[index + 1])
    end
  end
  return array[0][0] + rev[rev.length - 2].max
end 

puts path("18_tri.txt")
puts path("67_tri.txt")



