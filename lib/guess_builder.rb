require './lib/guess'

class GuessBuilder
  attr_reader :formatted_guess, :string_guess

  def initialize(guess)
    @formatted_guess = guess.split("")
    @string_guess = guess.chomp #@formatted_guess.join("").chomp
  end

  def make_guess
    Guess.new(@formatted_guess, Time.now)
  end

end
