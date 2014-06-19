gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/code_matcher'

class CodeMatcherTest < Minitest::Test

  def test_it_exists
    cm = CodeMatcher.new(%w[r g g b], %w[r g g b])
  end

  def test_it_counts_the_correct_letters
    cm = CodeMatcher.new(%w[r g g b], %w[r g g b])
    assert_equal %w[r g g b], cm.count_correct_letter
  end

  def test_it_counts_the_incorrect_letters
    cm = CodeMatcher.new(%w[r g g b], %w[r y g b])
    refute_equal %w[r y g b], cm.count_correct_letter
  end

  def test_it_counts_the_correct_positions
    cm = CodeMatcher.new(%w[r g g b], %w[r g g b])
    assert_equal %w[r g g b], cm.count_correct_position
  end

  def test_it_counts_the_incorrect_positions
    cm = CodeMatcher.new(%w[r g g b], %w[r y g b])
    refute_equal %w[r g g b], cm.count_correct_position
  end

end
