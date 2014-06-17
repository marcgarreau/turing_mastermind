require './lib/game_repl'
require './lib/code_generator'
require './lib/code_matcher'
require './lib/guess_builder'
require './lib/code_matcher'
require 'pry'

class Game
  def self.start
    gen = CodeGenerator.new("easy")
    @code_word = gen.generate_code

    # init_variables

    while @code_word.secret_code != @matched_position && @counter >= 0
      print_im_thinking

      @guess = GuessBuilder.new(gets.chomp.downcase)
      @guesses << @guess.string_guess

      matcher = CodeMatcher.new(@guess.formatted_guess, @code_word.secret_code)
      @matched_letter = matcher.count_correct_letter
      @matched_position = matcher.count_correct_position

      print_guess_results #prints guess feedback
    end

    print_game_over_scenarios
  end

##################( Puzzle Assets )##################
  def init_variables
    @guess = ""
    @correct_letter = []
    @counter = 20
    @guesses = []
  end

  def print_im_thinking
    puts "
=======================================================
| I'm thinking of a #{@code_word.secret_code.count} letter combination. What is it? |
| There may be duplicate letters. Choices: RGBY       |
=======================================================\n\n"
  end

  def print_guess_results
    puts "You guessed #{@matched_letter.count} out of #{@code_word.secret_code.count} correct letters!"
    puts "Letters in the correct position: #{@matched_position.count}"
    puts "(#{@counter} turns remaining)"
    puts "Your guesses: #{@guesses}"
    @counter -= 1
  end

  def print_game_over_scenarios
    @time_end = Time.now
    if @counter < 0
      puts "Aw too bad. Your turns ended before you got the answer. The correct answer was #{@code_word.secret_code}. Try again!"
    elsif @matched_position == @code_word.secret_code
      puts "Congratulations! You won with #{@guesses.count} guesses in #{converts_time}! The winning combination was #{@code_word.secret_code}."
    else
      puts "How did you escape?"
    end
  end

  def converts_time
    total_time = @time_end - @time_start
    @minutes = total_time.to_i / 60
    @seconds = total_time.to_i % 60
    "#{@minutes} minutes and #{@seconds} seconds"
  end

  ##################( Old Code )##################
  attr_reader :time_start, :guess, :correct_letter, :counter, :guesses

  def initialize
    # @guess_history = []
    @time_start = Time.now
    GameREPL.new.start

    @guess = ""
    @correct_letter = []
    @counter = 20
    @guesses = []
  end
  #
  # def guess_count
  #   @guess_history.count
  # end
  #
  # #used this (basically) in game_repl
  # def add_guess(guess)
  #   @guess_history << guess
  #   #eventually: add the guess & stats (hash) to a guess array
  # end

end

if __FILE__ == $0
  Game.new
end
