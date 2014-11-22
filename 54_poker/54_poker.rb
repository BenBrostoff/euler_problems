class Array

  def freq_table
    freq = Hash.new(0)
    self.each { |x| freq[x] += 1 }
    return freq
  end
  
end

class Card

  attr_accessor :value, :suit

  def initialize(value, suit)
    @value, @suit = value, suit
  end 

end

class Hand

  attr_accessor :player, :cards, :tie_break, :nums

  STRAIGHTS, avail = [], (1..14).to_a
  avail.each_with_index do |num, i|
    if i < 10
      STRAIGHTS << avail[i..i + 4]
    end 
    # low straight allowance
    STRAIGHTS << [2,3,4,5,14]
  end

  RSTRAIGHT= [10, 11, 12, 13, 14]

  def initialize(player="P1", cards)
    @player, @cards = player, cards
    @nums, @suits = [],[]
    @cards.each do |card|
      @nums << card.value
      @suits << card.suit
    end
    @nums = @nums.sort
    @num_freq = @nums.freq_table.values
    @suit_freq = @suits.freq_table.values
    @tie_break = @nums.freq_table.sort_by { |key, value| value }.reverse
    @tie_break = @tie_break.map {|x| x[0] }.compact
  end

  def waterfall
    check_for_rflush
  end

  def check_for_rflush
    if @suit_freq.include? 5
      if @nums == RSTRAIGHT
        return 10
      end
    end
    check_for_sflush
  end

  def check_for_sflush
    # no tie break for suit
    if @suit_freq.include? 5
      if STRAIGHTS.include? @nums
        @tie_break = [@nums.max]
        return 9 
      end
    end
    check_for_fours
  end

  def check_for_fours     
    return 8 if @num_freq.include? 4
    check_for_full_house
  end

  def check_for_full_house
    if @num_freq.include? 3 
      if @num_freq.include? 2
        return 7 
      end
    end
    check_for_flush
  end

  def check_for_flush
    # no tie break for suit
    if @suit_freq.include? 5
      @tie_break = @nums.sort.reverse
      return 6 
    end
    check_for_straight
  end

  def check_for_straight
    if STRAIGHTS.include? @nums
      @tie_break = [@nums.max]
      @tie_break = [5] if @nums == [2,3,4,5,14]
      return 5 
    end
    check_for_threes
  end

  def check_for_threes
    if @num_freq.include? 3
      @tie_break[1..2] = @tie_break[1..2].sort.reverse
      return 4 
    end
    check_for_two_pair
  end

  def check_for_two_pair
    if @num_freq.freq_table.values.include? 2
      @tie_break[0..1] = @tie_break[0..1].sort.reverse
      return 3 
    end
    check_for_pairs
  end

  def check_for_pairs
    if @num_freq.include? 2
      @tie_break[1..4] = @tie_break[1..4].sort.reverse
      return 2 
    end
    check_for_high_card
  end

  def check_for_high_card
    @tie_break = @tie_break.sort.reverse
    return 1
  end

end

class Compare

  def initialize(hand_1, hand_2)
    @hand_1, @hand_2 = hand_1, hand_2
  end

  def compare
    if @hand_1.waterfall != @hand_2.waterfall
      return [@hand_1, @hand_2].sort_by {|x| x.waterfall}.reverse[0].player
    else
      (0...@hand_1.tie_break.length).to_a.each do |tie_index|
        return @hand_1.player if @hand_1.tie_break[tie_index] > @hand_2.tie_break[tie_index]
        return @hand_2.player if @hand_2.tie_break[tie_index] > @hand_1.tie_break[tie_index]
      end
    end
  end
  
end