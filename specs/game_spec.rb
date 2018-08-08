require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")
require_relative("../hidden_word.rb")
require_relative("../player.rb")

class GameTest < MiniTest::Test

def setup
  @player1 = Player.new("Player 1")
  @hidden_word = HiddenWord.new("ruby")
  @game1 = Game.new(@player1, @hidden_word)
end

def test_initial_game
  assert_equal("Player 1", @player1.name)
  assert_equal(6, @player1.lives)
  assert_equal("ruby", @hidden_word.word)
  assert_equal([], @game1.guessed_letters)
end

end
