class Guess
  attr_reader :formatted_guess, :string_guess, :timestamp

  def initialize(formatted_guess, timestamp)
    @formatted_guess = formatted_guess
    @string_guess = formatted_guess.join('').chomp
    @timestamp = timestamp
  end

end
