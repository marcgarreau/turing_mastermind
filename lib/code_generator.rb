require './lib/code'

class CodeGenerator
  attr_reader :difficulty

  def initialize(difficulty)
    @difficulty = difficulty
  end

  # def validate_difficulty
  #     diff = gets.downcase.chomp
  #     unless diff == ("easy" || "medium" || "hard")
  #       diff = gets.downcase.chomp
  #       puts "Invalid Diff Setting!"
  #     end
  #     diff
  # end

  def generate_code
    secret_code = []
    # unless difficulty == ("easy" || "medium" || "hard")
      case @difficulty #@difficulty
      when "easy"
        potential_letters = %w[r g b y]
        4.times { secret_code << potential_letters.shuffle.first }
        Code.new(secret_code)
      when "medium"
        potential_letters = %w[r g b y w]
        6.times { secret_code << potential_letters.shuffle.first }
        Code.new(secret_code)
      when "hard"
        potential_letters = %w[r g b y w p]
        8.times { secret_code << potential_letters.shuffle.first }
        Code.new(secret_code)
      else
        print "Invalid difficult setting. Select from easy, medium, or hard: "
        # @difficulty = gets.downcase.chomp
      end
    #end
  end
end
