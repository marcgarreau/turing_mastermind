gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/game'

class GameTest < Minitest::Test
  def test_new_game_can_be_created
    game = Game.new
  end

  def test_new_game_has_zero_guess
    game = Game.new
    assert_equal 0, game.guess_count
  end

  def test_a_game_can_generate_a_code
    game = Game.new
    game.generate_a_code
    assert_equal 4, @code_word.length
  end

  def test_one_guess_adds_to_the_guess_count
    game = Game.new
    #assert_equal 1, game.guess_count
  end

end
