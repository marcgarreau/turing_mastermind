class Code
  attr_reader :secret_code

  def initialize(secret_code)
    @secret_code = secret_code
    # CodeGenerator.new.generate_code
  end

end
