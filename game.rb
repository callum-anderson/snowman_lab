class Game
attr_accessor(:guessed_letters)
attr_reader(:word)

def initialize(player, word)
  @player = player
  @word = word
  @guessed_letters = []
end

def guess_a_letter(letter)
  if @word.check_letter(letter)
    @guessed_letters.push(letter)
  else
    @player.lives -= 1
  end
  
end

# def game_progress_won
#   if @word.word == @word.display_word(@guessed_letters)
#     return "You have won!"
#   else return "Keep trying!"
#   end
  # end

def game_progress_won
  if @word.word == @word.display_word(@guessed_letters)
    return true
  else return false
  end
end

def game_progress_lost
  if @player.lives == 0
    return true
  else return false
  end
end

# def game_progress_lost
#   if @player.lives == 0
#     return "You have lost!"
#   elsif @player.lives >= 2
#     return "Keep trying!"
#   else return "You have one life left!"
#   end
# end

end
