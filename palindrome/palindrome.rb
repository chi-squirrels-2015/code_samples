# Iterative solution
# def is_palindrome?(word)
#   until automatic_palindrome?(word)
#     return false unless first_and_last_characters_the_same?(word)
#     word = trim(word)
#   end

#   true
# end

#Recursive solution
def is_palindrome?(word)
  return true if automatic_palindrome?(word)
  return false unless first_and_last_characters_the_same?(word)
  is_palindrome? trim(word)
end

def automatic_palindrome?(word)
  word.length < 2
end

def first_and_last_characters_the_same?(word)
  word[0] == word[-1]
end

def trim(word)
  word[1..-2]
end
