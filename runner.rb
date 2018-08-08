require_relative("./game.rb")
require_relative("./hidden_word.rb")
require_relative("./player.rb")

secret_word = HiddenWord.new("learn")
puts "Welcome to Snowman game! Please enter your name:"
player_name = gets.chomp
player1 = Player.new(player_name)
new_game = Game.new(player1, secret_word)

puts "Welcome #{player_name}...   please enter a letter"

while new_game.game_progress_won == false && new_game.game_progress_lost == false
guess = gets.chomp()
new_game.guess_a_letter(guess)
puts secret_word.display_word(new_game.guessed_letters)
if player1.lives == 1
  puts "You have 1 life left!"
end
end
if new_game.game_progress_won == true
  puts "Well done, you guessed correctly!"
else puts "You ran out of lives"
end
