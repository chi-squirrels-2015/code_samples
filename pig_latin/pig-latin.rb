class PigLatinizer
  def convert(string)
    string.split.map { |x| pigify(x) }.join(" ")
  end

  def pigify(word)
    return word if word =~ VOWELS_AT_START

    word.sub PARTS_OF_WORD do
      "#{$~[:lead_punc]}#{correct_capitalization($~[:base] + $~[:lead_consonants])}ay#{$~[:contraction]}#{$~[:end_punc]}"
    end
  end

  private
  VOWELS_AT_START = /\A[aeiou]/i

  CAPITAL_LETTER = /[A-Z]/

  PARTS_OF_WORD = %r{
    \A
    (?<lead_punc>\W+)?
    (?<lead_consonants>[^aeiou]+)?
    (?<base>\w*?)
    (?<contraction>\'\w+\z|n\'t)?
    (?<end_punc>\W+)?
    \z
  }xi

  def correct_capitalization(word)
    return word unless word =~ CAPITAL_LETTER
    word.downcase.capitalize
  end
end
