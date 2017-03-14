require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'validation.rb'

class Route
  include Validation

  attr_accessor :stations
  attr_reader :first_station, :finish_station

  validate :first_station, :presence
  validate :first_station, :type, Station
  validate :finish_station, :presence
  validate :finish_station, :type, Station

  def initialize(first_station, finish_station)
    @first_station = first_station
    @finish_station = finish_station
    @stations = [@first_station, @finish_station]

    validate!
  end

  def add_intermediate_station(index, station)
    if (stations.size == 2 && index != 2) || index == 1
      raise_error
    else
      stations.insert(index - 1, station)
    end
  end

  def delete_intermediate_station(index)
    if stations.size == 2 || index == 1 || index == stations.size
      raise_error
    else
      stations.delete_at(index - 1)
    end
  end

  private

  def raise_error
    raise 'Действие невозможно!'
  end
end
