module Validatable
  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Метод #validate! должен быть переопределен в классе в секции protected!'
  end
end
