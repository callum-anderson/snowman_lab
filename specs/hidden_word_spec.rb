require("minitest/autorun")
require("minitest/rg")
require_relative("../hidden_word.rb")
require_relative("../game.rb")
require_relative("../player.rb")

class HiddenWordTest < MiniTest::Test

def setup
  @player1 = Player.new("Player 1")
  @word = HiddenWord.new("snowman")
  @game1 = Game.new(@player1, @hidden_word)
  @game1.guessed_letters.push("s")
  @game1.guessed_letters.push("w")
end

#redundant test
  # def test_display_word
  #   assert_equal("snowman", @word.display_word(@game1))
  # end

#redundant test
# def test_display_word__if_guessed_letters_empty
#   assert_equal("*******", @word.display_word(@game1))
# end

def test_display_word__if_guessed_letters_not_empty
  assert_equal("s**w***", @word.display_word(@game1))
end

def test_check_letter
  assert_equal(true, @word.check_letter("m"))
end

end
