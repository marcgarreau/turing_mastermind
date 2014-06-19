require './lib/game_repl'
require './lib/code_generator'
require './lib/code_matcher'
require './lib/guess_builder'
require './lib/code_matcher'
require 'colored'
require 'pry'

class Game
  attr_reader :guess, :counter, :guesses

  def initialize
    @guess = ""
    @counter = 20
    @guesses = []
  end

##################( Gameplay )##################
  def play
    generate_a_code
    @time_start = Time.now
    while @code_word.secret_code != @matched_position && @counter >= 0
      print_im_thinking
      build_a_guess # until guess_is_valid?
      match_a_guess
      print_guess_results
    end
    print_game_over_scenarios
  end

##################( Gameplay Methods )##################
  def generate_a_code
    validate_user_diff
    gen = CodeGenerator.new(@diff) #could put GameREPL in here
    @code_word = gen.generate_code
  end

  def validate_user_diff
    @diff = GameREPL.new.validate_difficulty
  end

  def build_a_guess
    @input = gets.chomp.downcase
    if @input == 'q'
      quit_game
    else
      validate_guess
    end
    add_a_guess
  end

  def quit_game
    puts "\nQuitting game...".red
    GameREPL.new.start
  end

  def validate_guess
    @guess = GuessBuilder.new(@input).make_guess #pass in @g
      until guess_is_valid?
        puts "Your guess must be #{@code_word.code_length} letters. Try again.\n".red
        @guess = GuessBuilder.new(gets.chomp.downcase).make_guess #pass in @g
      end
  end

  def guess_is_valid?
    @guess.formatted_guess.length == @code_word.code_length
  end

  def add_a_guess
    @guesses << @guess.string_guess
  end

  def match_a_guess
    matcher = CodeMatcher.new(@guess.formatted_guess, @code_word.secret_code)
    @matched_letter = matcher.count_correct_letter
    @matched_position = matcher.count_correct_position
  end

##################( Gameplay Assets )##################
  def print_im_thinking
    border
    print "
  I'm thinking of a #{@code_word.secret_code.count}-letter combination. What is it?
  There may be duplicate letters. #{diff_choice}
  If you're scared and wimpy, enter 'q' to quit." # => change for diff lvls
    border_bottom
  end

  def border
    print "
=======================================================".blue
  end

  def border_bottom
    puts "
=======================================================".blue
  end

  def diff_choice
    case @diff
    when "easy"
      "Choices: r g b y".red
    when "medium"
      "Choices: r g b y w".red
    when "hard"
      "Choices: r g b y w p".red
    end
  end

  def print_guess_results
    puts "You guessed #{@matched_letter.count} out of #{@code_word.secret_code.count} correct letters!"
    puts "Letters in the correct position: #{@matched_position.count}"
    puts "(#{@counter} turns remaining)".red
    puts "Your guesses: #{@guesses}"
    @counter -= 1
  end

  def print_game_over_scenarios
    @time_end = Time.now
    # Game lost:
    if @counter < 0
      puts "\nAw too bad. You used all your turns up in #{converts_time}. The correct answer was '#{@code_word.code_text}'. Try again!".red
    # Game won:
    elsif @matched_position == @code_word.secret_code
      puts "\nCongratulations! You won with #{guess_count} guesses in #{converts_time}! The winning combination was '#{@code_word.code_text}'.".red
    # Testing: did a game end with any other conditions?
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

  def guess_count
    @guesses.count
  end

end

if __FILE__ == $0
  # GameREPL.new.start
end
