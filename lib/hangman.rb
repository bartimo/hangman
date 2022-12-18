require 'pry-byebug'

class Hangman
  attr_reader :word_array, :max_attempts
  attr_accessor :current_round, :game_array, :guessed_letters, :attempts, :game_over

  def initialize(
    min_length = 4,
    max_length = 12,
    max_attempts = 6,
    current_round = 1,
    attempts = 0
  )
    @min_length = min_length
    @max_length = max_length
    @word_source = './res/wordlist.txt'
    @word_array = determine_word
    @game_array = Array.new(@word_array.length, '_')
    @guessed_letters = Array.new(26,' - ')
    @current_round = current_round
    @attempts = attempts
    @max_attempts = max_attempts
    @game_over = false
  end

  def load_saved_game
    puts "load game here"
  end

  def display_intro
    puts 'Welcome to Hangman!'
    puts "Type 'load' to continue your last game. Enter any other key to start a new game."
    load_saved_game if response = gets.chomp
    puts ''
    puts "The word was randomly selected from one of #{@word_list_size} options between #{@min_length} and #{@max_length} in length."
    puts "You have #{@max_attempts} attempt(s) to solve the puzzle "
  end

  def display_game_board
    show_gallows(@attempts)
    puts ''
    puts "[ #{@game_array.map{ |i| " #{i} "}.join('')} ]"
    puts ''
    puts ''
    display_guessed_letters
    puts ''
  end

  def display_guessed_letters
    puts 'Guessed letters:'
    puts ''
    puts "| #{@guessed_letters[0..12].join('')} |"
    puts "| #{@guessed_letters[13..26].join('')} |"
  end


  def get_guess
    guess = nil
    loop do
      puts "Enter your guess"
      guess = gets.chomp.upcase
      if guess.match?(/[A-Z]/) && guess.length == 1 && !@guessed_letters.any?(" #{guess} ") 
        @guessed_letters[guess.ord - 65] = " #{guess} "
        break
      else 
        puts ''
        display_game_board
        puts "Invalid entry, try again.\n"
      end
    end 
    guess
  end

  def make_guess(guess)
    @word_array.index(guess) ? process_correct_guess(guess) : process_incorrect_guess
  end

  def show_gallows(attempts)
    puts ''
    case attempts
    when 0
      puts '  +----+  '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts 
    when 1
      puts '  +----+  '
      puts '  |    O  '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts 
    when 2
      puts '  +----+  '
      puts '  |    O  '
      puts '  |   /   '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts 
    when 3
      puts '  +----+  '
      puts '  |    O  '
      puts '  |   / \ '
      puts '  |       '
      puts '  |       '
      puts '  |       '
      puts ' ==========='
      puts ''
    when 4
      puts '  +----+  '
      puts '  |    O  '
      puts '  |   /|\ '
      puts '  |    |  '
      puts '  |       '
      puts '  |       '
      puts ' ==========='
      puts ''
    when 5
      puts '  +----+  '
      puts '  |    O  '
      puts '  |   /|\ '
      puts '  |    |  '
      puts '  |   /   '
      puts '  |       '
      puts ' ==========='
      puts ''
    when 6
      puts '  +----+  '
      puts '  |    O  '
      puts '  |   /|\ '
      puts '  |    |  '
      puts '  |   / \ '
      puts '  |       '
      puts ' ==========='
      puts ''
    end
  end
end

  private

  def determine_word
    word_list = []
    File.foreach(@word_source) do |line|
      word_list.push(line.chomp) if line.chomp.length.between?(@min_length, @max_length)
    end
    @word_list_size = word_list.length.to_s
    word_list.shuffle.first.upcase.split('')
  end

  def process_incorrect_guess
    @attempts += 1
    if @attempts == @max_attempts
      @game_over = true
      show_gallows(6)
      puts "\nYOU LOSE\n"
      puts ''
    else
      puts '' 
      puts "Incorrect. you have made #{@attempts} of #{@max_attempts} attempts"
    end
  end

  def process_correct_guess(guess)
    @word_array.each_with_index do |value, index|
      if value == guess
        @game_array[index] = "#{guess}"
      end
    end
    if @word_array == @game_array
      puts "\nYOU WIN\n"
      puts ''
      @game_over = true
    end
  end
