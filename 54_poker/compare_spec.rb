require_relative "54_poker.rb"

describe "Compare" do

  let(:royal_flush) { Hand.new([Card.new(10, "C"), Card.new(11, "C"),
                                Card.new(12, "C"), Card.new(13, "C"),
                                Card.new(14, "C")]) }

  let(:straight_flush) { Hand.new("P2", [Card.new(9, "C"), Card.new(10, "C"),
                                         Card.new(11, "C"), Card.new(12, "C"),
                                         Card.new(13, "C")]) }

  let(:pair_1) { Hand.new([Card.new(3, "H"), Card.new(3, "C"),
                           Card.new(4, "S"), Card.new(8, "H"),
                           Card.new(11, "H")]) }

  let(:pair_2) { Hand.new("P2", [Card.new(3, "H"), Card.new(3, "C"),
                                 Card.new(4, "S"), Card.new(8, "H"),
                                 Card.new(14, "H")]) }

  it "should return the right hand" do
    expect(Compare.new(royal_flush, straight_flush).compare).to eq("P1")
  end

  it "should tie break correctly" do
    expect(Compare.new(pair_1, pair_2).compare).to eq("P2")
  end 

end
