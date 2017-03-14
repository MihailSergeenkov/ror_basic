require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :number_of_busy_seats
  attr_reader :number_of_seats

  validate :number_of_seats, :presence
  validate :number_of_seats, :type, Fixnum
  validate :number_of_seats, :positive

  def initialize(number_of_seats)
    @number_of_seats = number_of_seats
    @number_of_busy_seats = 0
    validate!
  end

  def busy_seat
    self.number_of_busy_seats += 1 if number_of_busy_seats < number_of_seats
  end

  def number_of_free_seats
    number_of_seats - number_of_busy_seats
  end

  def type
    :passenger_carriage
  end

  private

  attr_writer :number_of_busy_seats
end
