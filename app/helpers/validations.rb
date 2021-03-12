module Validations
  class InvalidParams < StandardError; end
  
  def validate_with!(validation)
    result = validate_with(validation)
    raise InvalidParams if result.failure?
    result
  end

  def validate_with(validation)
    contract = validation.new
    contract.call(params)
  end
end