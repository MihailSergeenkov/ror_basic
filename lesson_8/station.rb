require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'validatable.rb'

class Station
  include Validatable

  @@stations = []

  attr_accessor :trains
  attr_reader :name

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

  protected

  def validate!
    raise 'Название не может быть пустым!' if name.nil?
    raise 'Название должно состоять как минимум из 3 букв!' if name.length < 3
    true
  end
end
