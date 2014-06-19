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
    gen = CodeGenerator.new("easy")
    @code_word = gen.generate_code
    assert_equal 4, @code_word.code_length
  end

  def test_a_game_can_generate_a_medium_code
    game = Game.new
    gen = CodeGenerator.new("medium")
    @code_word = gen.generate_code
    assert_equal 6, @code_word.code_length
  end

  def test_guess_builder_creates_guess_objects
    game = Game.new
    guess = GuessBuilder.new("rggy").make_guess
    assert_equal "rggy", guess.string_guess
  end

  def test_guess_objects_jive
    game = Game.new
    @guess = Guess.new(["r","r","g","g"], Time.now)
    assert_equal "rrgg", @guess.string_guess
  end

  def test_code_gen_and_guess_builder_jive
    game = Game.new
    gen = CodeGenerator.new("easy")
    @code_word = gen.generate_code
    @guess = Guess.new(["r","r","g","g"], Time.now)
    assert_equal @code_word.code_length, @guess.formatted_guess.length
  end

  def test_one_guess_adds_to_the_guess_count
    game = Game.new
    #assert_equal 1, game.guess_count
  end

end
