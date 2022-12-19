require './lib/hangman'
require 'pry-byebug'
require 'yaml'

def save_game(game)
  File.write('save.ini', game.to_yaml, mode: 'w')
  puts "Gave saved"
  game.game_over = true
end

def load_saved_game
  game = YAML.load(File.read("save.ini"),permitted_classes: [Hangman])
end


puts 'Welcome to Hangman!'
puts "Type 'load' to continue your last game. Enter any other key to start a new game."
puts "enter 'save' at any time to save and exit the game"
gets.chomp.upcase == 'LOAD' ? game = load_saved_game() : game = Hangman.new()
puts ''
puts "The word was randomly selected from one of #{@word_list_size} options between #{@min_length} and #{@max_length} in length."
puts "You have #{@max_attempts} attempt(s) to solve the puzzle "
p


until game.game_over
  game.display_game_board
  guess = game.get_guess
  guess == 'SAVE' ? save_game(game) : game.make_guess(guess)
  
end
  



