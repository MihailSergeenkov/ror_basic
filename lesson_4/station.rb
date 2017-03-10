require_relative 'train.rb'
require_relative 'route.rb'

class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    trains << train
  end

  def send_train(train)
    train.to_next_station
  end

  def delete_train(train)
    trains.delete(train)
  end

  def train_typeof(type)
    trains.select { |train| train.type == type }
  end
end
