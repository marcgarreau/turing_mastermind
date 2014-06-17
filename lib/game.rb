require './lib/game_repl'
require 'pry'

class Game
  attr_reader :guess_counter, :guess_history, :started_at

  def initialize
    @guess_history = []
    GameREPL.new.start
    @started_at = Time.now
  end

  def guess_count
    @guess_history.count
  end

  #how is this used?
  def add_guess(guess)
    @guess_history << guess
    #eventually: add the guess & stats (hash) to a guess array
  end

end

if __FILE__ == $0
  Game.new
end
