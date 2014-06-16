class Game
  attr_reader :guess_counter, :guess_history

  def initialize
    @guess_counter = 0
    @guess_history = []
  end

  def guess_count
    @guess_counter
  end

  def add_guess(guess)
    @guess_counter += 1
    @guess_history << guess
    #eventually: add the guess & stats (hash) to a guess array
  end


end
