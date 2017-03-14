require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'validatable.rb'

class Route
  include Validatable

  attr_accessor :stations

  def initialize(first_station, finish_station)
    @stations = [first_station, finish_station]

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

  protected

  def validate!
    stations.each do |station|
      raise 'Должен быть объект станции!' unless station.instance_of? Station
    end
    true
  end

  private

  def raise_error
    raise 'Действие невозможно!'
  end
end
