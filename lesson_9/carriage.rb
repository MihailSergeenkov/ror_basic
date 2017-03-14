require_relative 'nameable.rb'
require_relative 'validation.rb'

class Carriage
  include Nameable
  include Validation

  def type
    :carriage
  end
end
