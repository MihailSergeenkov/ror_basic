require_relative 'train.rb'
require_relative 'station.rb'

class Route
  attr_accessor :stations

  def initialize(first_station, finish_station)
    @stations = [first_station, finish_station]
  end

  def add_intermediate_station(index, station)
    if (stations.size == 2 && index != 2) || index == 1
      puts 'Неправильное размещение станции!'
    else
      stations.insert(index - 1, station)
    end
  end

  def delete_intermediate_station(index)
    if stations.size == 2
      puts 'Промежуточных станций нет!'
    elsif index == 1 || index == stations.size
      puts 'Нельзя удалить первую или последнюю станцию, только между!'
    else
      stations.delete_at(index - 1)
    end
  end
end
