require_relative "54_poker.rb"


describe "Poker" do 

  let(:royal_flush) { Hand.new([Card.new(10, "C"), Card.new(11, "C"),
                               Card.new(12, "C"), Card.new(13, "C"),
                               Card.new(14, "C")]) }

  let(:straight_flush) { Hand.new([Card.new(9, "C"), Card.new(10, "C"),
                               Card.new(11, "C"), Card.new(12, "C"),
                               Card.new(13, "C")]) }

  let(:full_house) { Hand.new([Card.new(3, "C"), Card.new(3, "H"),
                               Card.new(3, "D"), Card.new(2, "D"),
                               Card.new(2, "H")]) }

  let(:fours) { Hand.new([Card.new(3, "C"), Card.new(3, "H"),
                          Card.new(3, "D"), Card.new(3, "S"),
                          Card.new(2, "H")]) }

  let(:flush) { Hand.new([Card.new(3, "H"), Card.new(6, "H"),
                          Card.new(9, "H"), Card.new(10, "H"),
                          Card.new(11, "H")]) }


  let(:straight) { Hand.new([Card.new(3, "H"), Card.new(4, "C"),
                             Card.new(5, "H"), Card.new(6, "H"),
                             Card.new(7, "H")]) }


  let(:low_straight) { Hand.new([Card.new(14, "H"), Card.new(2, "C"),
                                 Card.new(3, "H"), Card.new(4, "H"),
                                 Card.new(5, "C")]) }

  let(:threes) { Hand.new([Card.new(3, "H"), Card.new(3, "C"),
                           Card.new(3, "S"), Card.new(10, "H"),
                           Card.new(11, "H")]) }

  let(:two_pair) { Hand.new([Card.new(3, "H"), Card.new(3, "C"),
                             Card.new(4, "S"), Card.new(4, "H"),
                             Card.new(11, "H")]) }

  let(:pair) { Hand.new([Card.new(3, "H"), Card.new(3, "C"),
                         Card.new(4, "S"), Card.new(8, "H"),
                         Card.new(11, "H")]) }


  it "should identify a royal flush" do
    expect(royal_flush.waterfall).to eq(10)
  end

  it "should identify a straight flush" do
    expect(straight_flush.waterfall).to eq(9)
  end

  it "should identify four of a kind" do
    expect(fours.waterfall).to eq(8)
    expect(fours.tie_break).to eq([3,2])
  end

  it "should identify a full house" do
    expect(full_house.waterfall).to eq(7)
    expect(full_house.tie_break).to eq([3,2])
  end 

  it "should identify a flush" do
    expect(flush.waterfall).to eq(6)
  end 

  it "should identify a straight" do
    expect(straight.waterfall).to eq(5)
    expect(straight.tie_break).to eq([7])
  end 

  it "should identify a low straight with an ace" do
    expect(low_straight.waterfall).to eq(5)
    expect(low_straight.tie_break).to eq([5])
  end

  it "should identify three of a kind" do
    expect(threes.waterfall).to eq(4)
    expect(threes.tie_break).to eq([3,11,10])
  end

  it "should identify two pair" do
    expect(two_pair.waterfall).to eq(3)
  end

  it "should identify a pair" do
    expect(pair.waterfall).to eq(2)
    expect(pair.tie_break).to eq([3,11,8, 4])
  end

end

