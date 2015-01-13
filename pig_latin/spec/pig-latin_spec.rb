require_relative '../Pig-latin'

describe PigLatinizer do
  let(:latinizer) { PigLatinizer.new }

  describe "#convert" do
    it "returns pig latinized single words" do
      expect(latinizer.convert "abc").to eq "abc"
    end

    it "returns pig latinized sentences" do
      string = "\"That shouldn't work,\" I'd said."
      expect(latinizer.convert string).to eq "\"Atthay ouldshayn't orkway,\" I'd aidsay."
    end
  end

  describe "#pigify" do

    it "doesn't change strings starting with a vowel" do
      expect(latinizer.pigify "abc").to eq "abc"
      expect(latinizer.pigify "ebc").to eq "ebc"
      expect(latinizer.pigify "ibc").to eq "ibc"
      expect(latinizer.pigify "obc").to eq "obc"
      expect(latinizer.pigify "Ubc").to eq "Ubc"
    end

    it "handles strings beginning with a single consonant" do
      expect(latinizer.pigify "bac").to eq "acbay"
    end

    it "handles strings beginning with multiple consonants" do
      expect(latinizer.pigify "bbbac").to eq "acbbbay"
    end

    it "preserves punctuation at the beginning of strings" do
      expect(latinizer.pigify "\"bac").to eq "\"acbay"
    end

    it "preserves puncuation at the end end of strings" do
      expect(latinizer.pigify "abc\"").to eq "abc\""
    end

    it "preserves multiple punctuation marks" do
      expect(latinizer.pigify "something,\"").to eq "omethingsay,\""
    end

    it "preserves capitalization at the beginning of words" do
      expect(latinizer.pigify "Bac").to eq "Acbay"
    end

    it "preserves all capitalization and punctuation" do
      expect(latinizer.pigify "\"Toad\"").to eq "\"Oadtay\""
    end

    context "with contractions" do
      it "it preserves n't" do
        expect(latinizer.pigify "couldn't").to eq "ouldcayn't"
      end

      it "preserves 'd" do
        expect(latinizer.pigify "he'd").to eq "ehay'd"
      end

      it "preserves 's" do
        expect(latinizer.pigify "king's").to eq "ingkay's"
      end
    end
  end
end
