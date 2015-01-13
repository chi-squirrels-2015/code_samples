require 'rspec'

require_relative '../roman_numerals'

describe RomanNumerals do
  describe "converting arabic numbers to roman numerals" do
    it "converts 1" do
      expect(RomanNumerals.convert_to_roman 1).to eq "I"
    end

    it "converts 2" do
      expect(RomanNumerals.convert_to_roman 2).to eq "II"
    end

    it "converts 4" do
      expect(RomanNumerals.convert_to_roman 4).to eq "IV"
    end

    it "converts 5" do
      expect(RomanNumerals.convert_to_roman 5).to eq "V"
    end

    it "converts 6" do
      expect(RomanNumerals.convert_to_roman 6).to eq "VI"
    end

    it "converts 7" do
      expect(RomanNumerals.convert_to_roman 7).to eq "VII"
    end

    it "converts 9" do
      expect(RomanNumerals.convert_to_roman 9).to eq "IX"
    end

    it "converts 10" do
      expect(RomanNumerals.convert_to_roman 10).to eq "X"
    end

    it "converts 11" do
      expect(RomanNumerals.convert_to_roman 11).to eq "XI"
    end

    it "converts 12" do
      expect(RomanNumerals.convert_to_roman 12).to eq "XII"
    end

    it "converts 14" do
      expect(RomanNumerals.convert_to_roman 14).to eq "XIV"
    end

    it "converts 15" do
      expect(RomanNumerals.convert_to_roman 15).to eq "XV"
    end

    it "converts 37" do
      expect(RomanNumerals.convert_to_roman 37).to eq "XXXVII"
    end

    it "converts 40" do
      expect(RomanNumerals.convert_to_roman 40).to eq "XL"
    end

    it "converts 49" do
      expect(RomanNumerals.convert_to_roman 49).to eq "XLIX"
    end

    it "converts 50" do
      expect(RomanNumerals.convert_to_roman 50).to eq "L"
    end

    it "converts 90" do
      expect(RomanNumerals.convert_to_roman 90).to eq "XC"
    end

    it "converts 100" do
      expect(RomanNumerals.convert_to_roman 100).to eq "C"
    end

    it "converts 400" do
      expect(RomanNumerals.convert_to_roman 400).to eq "CD"
    end

    it "converts 500" do
      expect(RomanNumerals.convert_to_roman 500).to eq "D"
    end

    it "converts 900" do
      expect(RomanNumerals.convert_to_roman 900).to eq "CM"
    end

    it "converts 1000" do
      expect(RomanNumerals.convert_to_roman 1000).to eq "M"
    end

    it "converts 2849" do
      expect(RomanNumerals.convert_to_roman 2849).to eq "MMDCCCXLIX"
    end
  end
end
