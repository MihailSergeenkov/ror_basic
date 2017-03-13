require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_reader :busy_volume
  attr_reader :volume

  def initialize(volume)
    @volume = volume
    @busy_volume = 0
    validate!
  end

  def take_volume(volume)
    self.busy_volume += volume if self.busy_volume + volume <= self.volume
  end

  def free_volume
    volume - busy_volume
  end

  def type
    :cargo_carriage
  end

  protected

  def validate!
    raise 'Объем вагона должен быть действительным числом!' unless (volume.instance_of?(Float) || volume.instance_of?(Fixnum))
    raise 'Объем вагона должен быть положительным числом!' if volume <= 0
    true
  end

  private

  attr_writer :busy_volume
end
