module RomanNumerals

  ARABIC_TO_ROMAN = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
       9 => "IX",
       5 => "V",
       4 => "IV",
       1 => "I"
  }


  def self.convert_to_roman(arabic_number)
    ARABIC_TO_ROMAN.each_with_object(String.new) do |(arabic_key, roman_value), roman_numeral|
      quotient = arabic_number / arabic_key

      quotient.times { roman_numeral << roman_value }
      arabic_number -= (quotient * arabic_key)
    end
  end
end
