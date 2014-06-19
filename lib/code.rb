class Code
  attr_reader :secret_code, :code_length, :code_text

  def initialize(secret_code)
    @secret_code = secret_code
    @code_text   = secret_code.join('')
    @code_length = secret_code.length
  end

end
