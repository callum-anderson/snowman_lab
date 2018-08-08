require_relative("./game.rb")
require_relative("./hidden_word.rb")
require_relative("./player.rb")
require("pry")


puts "Welcome to Snowman game! Player 1 - please enter the secret word or phrase to guess: "
  secret_word_input = gets.chomp
while !(secret_word_input =~ /[a-zA-Z]+/)
  puts "Please enter a word or phrase with alpha characters only."
  secret_word_input = gets.chomp
end
secret_word_input = secret_word_input.split
system("clear")
secret_word = HiddenWord.new(secret_word_input)
player1 = Player.new("Player 1")
new_game = Game.new(player1, secret_word)

puts "Welcome Player 2...   your word/phrase has #{secret_word.word.join.length} characters."
puts "Please enter a letter."

while new_game.game_progress_won == false && new_game.game_progress_lost == false
  guess = gets.chomp()
  if guess.length > 1
    puts "You must enter only one character!"
  elsif !(guess =~ /[[:alpha:]]/)
    puts "The word does not contain letters/symbols - please enter a character."
  else
    new_game.guess_a_letter(guess)
    puts secret_word.display_word(new_game.guessed_letters).join(" ")
    if player1.lives == 1
      puts "You have 1 life left!"
    end
  end

end
if new_game.game_progress_won == true
  puts "Well done, you guessed correctly!"
else puts "You ran out of lives"
end
