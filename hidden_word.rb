class HiddenWord
attr_reader(:word)
def initialize(word)
  @word = word
end

  def display_word(guessed_letters)
      words_to_return = []
    @word.each{|w| word_to_return = ""
      w.each_char {|c|
        if guessed_letters.include?(c)
          word_to_return << c
        else
          word_to_return << "*"
        end
      }
      words_to_return.push(word_to_return)
    }


    return words_to_return
  end

  def check_letter(letter)
    if @word.join.include?(letter)
      return true
    else return false
    end
  end
end
