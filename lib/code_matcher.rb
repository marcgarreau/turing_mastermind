require './lib/game_repl'
require './lib/game'
require './lib/code'

class CodeMatcher
  attr_reader :guess, :secret_code

  def initialize(guess, secret_code)
    @guess       = guess
    @secret_code = secret_code
  end

  # for each value of formatted_guess, is it contained in word?
  def count_correct_letter
    @correct_letter = []
    @guess.each do |letter|
      if @secret_code.include?(letter)
        @correct_letter << letter
      end
    end
    return @correct_letter
  end

  def count_correct_position
    @correct_position = []
    @secret_code.length.times do |i|
      if @guess[i] == @secret_code[i]
        @correct_position << @secret_code[i]
      end
    end
    return @correct_position
  end

end
