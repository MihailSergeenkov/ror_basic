require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'validation.rb'

class Station
  include Validation

  @@stations = []

  attr_accessor :trains
  attr_reader :name

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name

    validate!

    @trains = []
    @@stations << self
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

  def self.all
    @@stations
  end

  def each_train
    trains.each { |train| yield(train) }
  end
end
