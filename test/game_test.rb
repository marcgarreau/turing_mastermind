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

  def test_game_will_count_guesses
    game = Game.new
    game.add_guess("RGGB")
    assert_equal 1, game.guess_count
  end

  def test_guess_has_content
    game = Game.new
    game.add_guess("RGGB")
    assert_equal "RGGB", game.guess_history.last
  end

  def test_guess_has_newer_content
    game = Game.new
    game.add_guess("RGGB")
    game.add_guess("GGBB")
    assert_equal "GGBB", game.guess_history.last
  end


end
