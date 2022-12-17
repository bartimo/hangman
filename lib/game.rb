require './lib/hangman'

game = Hangman.new()

game.display_intro
puts ''
puts ''
#p game.word_array


until game.game_over
  game.display_game_board
  loop do
    puts "Enter your guess"
    guess = gets.chomp.upcase
    if guess.match?(/[A-Z]/) && guess.length == 1
      if game.check_for_valid_guess(guess)
        break
      end
    
    else 
      puts ''
      game.display_guessed_letters
      puts "Invalid entry, try again.\n"
    end
  end
  puts ''
  game.display_guessed_letters

end
  



