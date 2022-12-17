require './lib/hangman'
require 'pry-byebug'

game = Hangman.new()

game.display_intro
puts ''
puts ''
#p game.word_array


until game.game_over
  game.display_game_board
  guess = game.get_guess
  game.display_guessed_letters
  

end
  



