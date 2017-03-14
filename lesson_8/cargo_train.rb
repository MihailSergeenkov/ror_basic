require_relative 'train.rb'
class CargoTrain < Train
  def type
    :cargo_train
  end

  protected

  def correct_type?(carriage)
    raise 'Не тот тип вагонов!' unless carriage.type == :cargo_carriage
    true
  end
end
