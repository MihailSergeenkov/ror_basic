require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :number_of_busy_seats
  attr_reader :number_of_seats

  def initialize(number_of_seats)
    @number_of_seats = number_of_seats
    @number_of_busy_seats = 0
    validate!
  end

  def busy_seat
    self.number_of_busy_seats += 1 if self.number_of_busy_seats < self.number_of_seats
  end

  def number_of_free_seats
    number_of_seats - number_of_busy_seats
  end

  def type
    :passenger_carriage
  end

  protected

  def validate!
    raise 'Число мест должно быть целым числом!' unless number_of_seats.instance_of? Fixnum
    raise 'Число мест должно быть положительным числом!' if number_of_seats <= 0
    true
  end

  private

  attr_writer :number_of_busy_seats
end
