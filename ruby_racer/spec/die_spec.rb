require_relative '../die'

describe Die do
  let(:die) { Die.new }
  it "has a default number of sides" do
    expect(die.sides).to eq 6
  end

  it "has a specified number of sides" do
    expect(Die.new(12).sides).to eq 12
  end

  describe "#roll" do
    it "calls for a random number" do
      expect(die).to receive(:rand).with((1..6))
      die.roll
    end

    it "returns a number" do
      expect(die.roll).to be_a_kind_of(Integer)
    end
  end
end
