require_relative '../palindrome'

describe "is_palindrome?" do
  it "considers empty strings as palindromes" do
    expect(is_palindrome?(String.new)).to be true
  end

  it "considers one-letter words as palindromes" do
    expect(is_palindrome?("a")).to be true
  end

  it "considers two-letter words made of the same character as palindromes" do
    expect(is_palindrome?("aa")).to be true
  end

  it "considers two-letter words made of different characters as non-palindromes" do
    expect(is_palindrome?("ab")).to be false
  end

  it "identifies palindromes for three-letter words" do
    expect(is_palindrome?("aba")).to be true
  end

  it "identifies non-palindromes for three-letter words" do
    expect(is_palindrome?("abc")).to be false
  end

  it "identifies palindromes for four-letter words" do
    expect(is_palindrome?("abba")).to be true
  end

  it "identifies non-palindromes for four-letter words" do
    expect(is_palindrome?("abca")).to be false
  end

  it "identifies long palindromes" do
    expect(is_palindrome?("abcdefggfedcba")).to be true
  end

    it "identifies long non-palindromes" do
    expect(is_palindrome?("abcdefggXXXXba")).to be false
  end
end
