require 'rspec'

require_relative '../binary_search'

describe "#binary_search" do
  it "returns -1 if collection is empty" do
    expect(binary_search 0, Array.new ).to eq -1
  end

  it "returns -1 if target is less than smallest value in collection" do
    expect(binary_search 0, (1..10).to_a).to eq -1
  end

  it "returns -1 if target is greater than largest value in collection" do
    expect(binary_search 11, (1..10).to_a).to eq -1
  end

  it "finds index of target in a collection size of 1" do
    expect(binary_search 5, [5]).to eq 0
  end

  it "finds index of target at first index in a collection size of 2" do
    expect(binary_search 5, [5, 6]).to eq 0
  end

  it "finds index of target at the second index in a collection size of 2" do
    expect(binary_search 6, [5, 6]).to eq 1
  end

  it "finds index of target in an even-sized array" do
    expect(binary_search 6, (1..8).to_a).to eq 5
  end

  it "finds index of target in an odd-sized array" do
    expect(binary_search 2, (1..9).to_a).to eq 1
  end

  it "finds index of target when target is at first index" do
    expect(binary_search 1, (1..50).to_a).to eq 0
  end

  it "finds index of target when target is at last index" do
    expect(binary_search 50, (1..50).to_a).to eq 49
  end
end
