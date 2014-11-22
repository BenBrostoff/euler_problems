require_relative "54_poker"

LETTERS = {
  "T" => 10,
  "J" => 11,
  "Q" => 12,
  "K" => 13,
  "A" => 14
}

def deal(player, up, down)
  file = File.new("poker.txt", "r")
  hands, hand_hold, array = [], [], []
  while line = (file.gets)
    array << line.split(" ")
    prep = array[0][up..down].map {|i| i.split('') }.flatten
    prep = prep.each_with_index { |x,i| prep[i] = LETTERS[x] if LETTERS.keys.include? x }
    prep = prep.each_with_index {|x,i| prep[i] = x.to_i if i % 2 == 0}
    prep.each_with_index do |x,i|
      if i < prep.length - 1 && i % 2 == 0
        hand_hold << Card.new(prep[i], prep[i+1])
      end
    end
    hands << Hand.new(player, hand_hold)
    array, hand_hold = [], []
  end  
  return hands
end

P_1 = deal("P1", 0, 4)
P_2 = deal("P2", 5, 9)
score =[]

(0... P_1.length).to_a.each do |hand_index| 
  score << Compare.new(P_1[hand_index], P_2[hand_index]).compare
end

p score.select {|x| x == "P1"}.length