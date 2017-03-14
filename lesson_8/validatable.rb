module Validatable
  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Метод #validate! необходимо переопределить в секции protected!'
  end
end
