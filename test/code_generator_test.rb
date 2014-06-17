gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/code_generator'

class CodeGeneratorTest < Minitest::Test

  def test_it_exists
    cg = CodeGenerator.new
  end

  def test_generator_creates_an_array_with_four_values
    cg = CodeGenerator.new
    cg.generate_code
    assert_equal 4, cg.generate_code.length
  end

end
