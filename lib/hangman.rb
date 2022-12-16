class Hangman
  attr_reader :word_array
  attr_accessor :current_round

  def initialize(
    min_length = 4,
    max_length = 12,
    game_rounds = 6,
    current_round = 1
  )
  @min_length = min_length
  @max_length = max_length
  @game_rounds = game_rounds
  @word_source = './res/wordlist.txt'
  @word_array = determine_word
  @current_round = current_round
  end

  def determine_word
    word_list = []
    File.foreach(@word_source) do |line|
      word_list.push(line.chomp) if line.chomp.length.between?(@min_length, @max_length)
    end
    @word_list_size = word_list.length.to_s
    word_list.shuffle.first.split('')
  end

  def display_intro
    puts 'Welcome to Hangman!'
    puts "The word was randomly selected from one of #{@word_list_size} options between #{@min_length} and #{@max_length} in length."
    puts "You have #{@game_rounds} rounds to solve the puzzle "
  end
end



