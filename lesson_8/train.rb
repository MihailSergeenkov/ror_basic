require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'nameable.rb'
require_relative 'instance_counter.rb'
require_relative 'validatable.rb'
class Train
  include Nameable
  include InstanceCounter
  include Validatable

  @@trains = {}

  attr_accessor :speed, :current_station, :carriages
  attr_reader :route, :drive_route, :number

  NUMBER_FORMAT = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  def self.find(number)
    find_train = @@trains.find { |_index, train| train.number == number }
    find_train[1] unless find_train.nil?
  end

  def initialize(number)
    @number = number
    validate!

    @speed = 0
    @carriages = []
    @@trains[@@trains.size + 1] = self
    register_instance
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    add_carriage!(carriage) if speed.zero?
  end

  def delete_carriage(carriage)
    delete_carriage!(carriage) if speed.zero?
  end

  def route=(route)
    @route = route
    @current_station = drive_route.next
    @current_station.take_train(self)
  end

  def to_next_station
    current_station.delete_train(self)
    self.current_station = @drive_route.next unless last_station?
    current_station.take_train(self)
  end

  def next_station
    route_stations[number_current_station + 1]
  end

  def previous_station
    route_stations[number_current_station - 1] unless first_station?
  end

  def type
    :train
  end

  def each_carriage
    carriages.each { |carriage| yield(carriage) }
  end

  def number_of_carriages
    carriages.size
  end

  protected

  def correct_type?(_)
    true
  end

  def validate!
    raise 'Номер не может быть пустым!' if number.nil?
    raise 'Номер содержать как минимум 5 цифр или букв!' if number.length < 5
    raise 'Номер имеет неправильный формат!' if number !~ NUMBER_FORMAT
    true
  end

  private

  def add_carriage!(carriage)
    carriages << carriage if correct_type?(carriage)
  end

  def delete_carriage!(carriage)
    carriages.delete(carriage)
  end

  def drive_route
    @drive_route = route_stations.to_enum unless route.nil?
  end

  def last_station?
    current_station == route_stations.last
  end

  def first_station?
    current_station == route_stations.first
  end

  def number_current_station
    route_stations.index(current_station)
  end

  def route_stations
    route.stations
  end
end
