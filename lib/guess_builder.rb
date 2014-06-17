require './lib/guess'

class GuessBuilder
  attr_reader :formatted_guess, :string_guess

  def initialize(guess)
    @formatted_guess = guess.split("")
    @string_guess = @formatted_guess.join("").chomp
  end

  Guess.new(@formatted_guess, Time.now)

end
