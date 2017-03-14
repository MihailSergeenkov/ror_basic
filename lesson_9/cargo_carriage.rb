require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_reader :busy_volume
  attr_reader :volume

  validate :volume, :presence
  validate :volume, :type, Float
  validate :volume, :positive

  def initialize(volume)
    @volume = volume
    @busy_volume = 0
    validate!
  end

  def take_volume(volume)
    self.busy_volume += volume if busy_volume + volume <= self.volume
  end

  def free_volume
    volume - busy_volume
  end

  def type
    :cargo_carriage
  end

  private

  attr_writer :busy_volume
end
