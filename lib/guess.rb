class Guess
  attr_reader :formatted_guess, :timestamp

  def initialize(formatted_guess, timestamp)
    @formatted_guess = formatted_guess
    @timestamp = timestamp
  end

end
