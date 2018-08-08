class HiddenWord
attr_reader(:word)
def initialize(word)
  @word = word
end

  def display_word(guessed_letters)
      word_to_return = ""
    @word.each_char {|c|
      if guessed_letters.include?(c)
        word_to_return << c
      else
        word_to_return << "*"
      end
    }
    return word_to_return
  end

  def check_letter(letter)
    if @word.include?(letter)
      return true
    else return false
    end
  end
end
