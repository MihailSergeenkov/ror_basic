require_relative 'route.rb'
require_relative 'station.rb'

class Train
  TYPE = [:passanger, :cargo]
  CARRIAGE_ACTION = [:up, :down]

  attr_accessor :speed, :type, :current_station
  attr_reader :number_carriages, :route, :drive_route

  def initialize(number, type, number_carriages)
    @number = number
    @type = type
    @number_carriages = number_carriages
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def change_carriages(action)
    if speed.zero?
      if action == CARRIAGE_ACTION[0]
        @number_carriages += 1
      elsif action == CARRIAGE_ACTION[1]
        @number_carriages -= 1
      else
        puts 'Неизвестное действие!'
      end
    else
      puts 'Нельзя прицеплять/отцеплять вагоны в движении!'
    end
  end

  def route=(route)
    @route = route
    @current_station = drive_route.next
    @current_station.take_train(self)
  end

  def to_next_station
    self.current_station.delete_train(self)
    self.current_station = @drive_route.next unless last_station?
    self.current_station.take_train(self)
  end

  def next_station
    route_stations[number_current_station + 1]
  end

  def previous_station
    route_stations[number_current_station - 1] unless first_station?
  end

  private

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
