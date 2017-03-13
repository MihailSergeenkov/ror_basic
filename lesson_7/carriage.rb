require_relative 'nameable.rb'
require_relative 'validatable.rb'

class Carriage
  include Nameable
  include Validatable

  def type
    :carriage
  end
end
