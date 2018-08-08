require("minitest/autorun")
require("minitest/rg")
require("pry")
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

def test_guess_a_letter
  assert_equal(true, @hidden_word.check_letter("r"))
end

def test_guess_a_letter__true
  @game1.guess_a_letter("r")
  assert_equal("r", @game1.guessed_letters[0])
end

def test_guess_a_letter__false
  @game1.guess_a_letter("a")
  assert_nil(@game1.guessed_letters[0])
  assert_equal(5, @player1.lives)
end

def test_win_game
  @game1.guessed_letters = ["r","u","b","y"]
  assert_equal("You have won!", @game1.game_progress_won)
end

def test_lose_game
  assert_equal("Keep trying!", @game1.game_progress_lost)
end

def test_lose_game__no_lives
  @player1.lives = 0
  assert_equal("You have lost!", @game1.game_progress_lost)
end

def test_lose_game__one_life
  @player1.lives = 1
  assert_equal("You have one life left!", @game1.game_progress_lost)
end

end
