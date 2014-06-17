gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/code_generator'

class CodeGeneratorTest < Minitest::Test

  def test_it_exists
    cg = CodeGenerator.new("easy")
  end

  def test_generator_creates_an_array_with_four_values
    cg = CodeGenerator.new("easy")
    cg.generate_code
    assert_equal 4, cg.generate_code.secret_code.length
  end

  def test_generator_creates_an_array_with_six_values
    cg = CodeGenerator.new("medium")
    cg.generate_code
    assert_equal 6, cg.generate_code.secret_code.length
  end

  def test_generator_creates_an_array_with_eight_values
    cg = CodeGenerator.new("hard")
    cg.generate_code
    assert_equal 8, cg.generate_code.secret_code.length
  end

end
