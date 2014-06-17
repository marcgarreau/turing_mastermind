require './lib/code_generator'
require './lib/code_matcher'
require './lib/guess_builder'
require './lib/game'
require 'pry'
require 'time_difference'

class GameREPL

##################( Main Menu )##################
  def start
    print_intro
    command = ""
    while command != 'n'
      print_ready
      command = gets.chomp.downcase
      case command
      when 'n' then print_outro
      when 'y' then Game.start
      when 'i' then print_instructions
      else
        print_invalid_command
      end
    end
  end

##################( Menu Assets )##################
  def print_intro
    puts "
=======================================================
            Welcome to Mastermind, Shitty.0!
======================================================="
  end

  def print_ready
    printf "\nAre you ready to play? (y/n/i): "
  end

  def print_invalid_command
    puts "Invalid command. Are you ready? (type: y or n)"
  end

  def print_instructions
    puts "Instructions: Guess a four letter combination of R, G, Y, and B. We'll give you feedback to help focus your next guess."
  end

  def print_outro
    puts "Bummer. See you next time."
  end

##################( Play Game )##################
  # def start_next_puzzle
  #   Game.start
  # end

    # class Game
    #   def self.start
    #
    #   end
    # end

    # puts "What difficulty would you like to play? (easy, medium, hard)"
  #   gen = CodeGenerator.new("easy")
  #   @code_word = gen.generate_code #this should be done in the code_gen class
  #
  #   initialize_variables
  #   while @code_word.secret_code != @matched_position && @counter >= 0
  #     print_im_thinking
  #
  #     @guess = GuessBuilder.new(gets.chomp.downcase)
  #     @guesses << @guess.string_guess
  #
  #     matcher = CodeMatcher.new(@guess.formatted_guess, @code_word.secret_code)
  #     @matched_letter = matcher.count_correct_letter
  #     @matched_position = matcher.count_correct_position
  #
  #     print_guess_results #prints guess feedback
  #   end
  #
  #   print_game_over_scenarios #prints win/loss report
  # end #end puzzle

##################( Puzzle Assets )##################
  # def initialize_variables
  #   @guess = ""
  #   @correct_letter = []
  #   @counter = 20
  #   @guesses = []
  # end

#   def print_im_thinking
#     puts "
# =======================================================
# | I'm thinking of a #{@code_word.secret_code.count} letter combination. What is it? |
# | There may be duplicate letters. Choices: RGBY       |
# =======================================================\n\n"
#   end

  # def print_guess_results
  #   puts "You guessed #{@matched_letter.count} out of #{@code_word.secret_code.count} correct letters!"
  #   puts "Letters in the correct position: #{@matched_position.count}"
  #   puts "(#{@counter} turns remaining)"
  #   puts "Your guesses: #{@guesses}"
  #   @counter -= 1
  # end

  # def print_game_over_scenarios
  #   @time_end = Time.now
  #   if @counter < 0
  #     puts "Aw too bad. Your turns ended before you got the answer. The correct answer was #{@code_word.secret_code}. Try again!"
  #   elsif @matched_position == @code_word.secret_code
  #     puts "Congratulations! You won with #{@guesses.count} guesses in #{convert_time}! The winning combination was #{@code_word.secret_code}."
  #   else
  #     puts "How did you escape?"
  #   end
  # end

  # def converts_time
  #   total_time = @time_end - @time_start
  #   @minutes = total_time.to_i / 60
  #   @seconds = total_time.to_i % 60
  #   "#{@minutes} minutes and #{@seconds} seconds"
  # end

end
