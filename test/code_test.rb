gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/code'

class CodeTest < Minitest::Test

  def test_it_exists
    secret = Code.new
  end

  def test_it_imports_a_sequence_from_code_sequencer
    new_code = Code.new
    assert_equal 4, new_code.secret_code.size

  end

end
