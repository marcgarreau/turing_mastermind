gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'

class GuessTest < Minitest::Test

  def test_it_exists
    g = Guess.new(["r", "g", "g", "y"], Time.now)
  end

  def test_it_initializes_with_an_array
    g = Guess.new(["r", "g", "g", "y"], Time.now)

    assert_equal 4, g.formatted_guess.length
  end

end
