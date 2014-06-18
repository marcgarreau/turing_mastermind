class Code
  attr_reader :secret_code, :code_length

  def initialize(secret_code)
    @secret_code = secret_code
    @code_length = secret_code.length
  end

end
