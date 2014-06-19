require './lib/code'

class CodeGenerator
  attr_reader :difficulty, :potential_letters

  def initialize(difficulty)
    @difficulty = difficulty
    @potential_letters = %w[r g b y w p]
  end

  def generate_code
    secret_code = []
    # unless difficulty == ("easy" || "medium" || "hard")
      case @difficulty
      when "easy"
        easy_letters = potential_letters[0..3]
        4.times { secret_code << easy_letters.shuffle.first }
        Code.new(secret_code)
      when "medium"
        medium_letters = potential_letters[0..4]
        6.times { secret_code << medium_letters.shuffle.first }
        Code.new(secret_code)
      when "hard"
        hard_letters = potential_letters[0..5]
        8.times { secret_code << hard_letters.shuffle.first }
        Code.new(secret_code)
      else
        print "Invalid difficult setting. Select from easy, medium, or hard: "
        # @difficulty = gets.downcase.chomp
      end
    #end
  end
end
