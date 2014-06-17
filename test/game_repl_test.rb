gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/game_repl'

class GameREPLTest < Minitest::Test

  def test_it_exists
    repl = GameREPL.new
  end

end
