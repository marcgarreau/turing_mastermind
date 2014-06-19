gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess_builder'

class GuessBuilderTest < Minitest::Test

  def test_it_exists
    gb = GuessBuilder.new("rggy")
  end

  def test_it_formats_guesses
    gb = GuessBuilder.new("rggy")

    assert_equal ["r", "g", "g", "y"], gb.formatted_guess
  end

  def test_it_returns_a_string_value_of_guess
    gb = GuessBuilder.new("rggy")

    assert_equal "rggy", gb.string_guess
  end

  def test_it_creates_a_guess_instance
    g = GuessBuilder.new("rggy").make_guess
    assert_equal Guess, g.class
  end

end
