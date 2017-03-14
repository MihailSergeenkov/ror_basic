require_relative 'train.rb'
class PassengerTrain < Train
  def type
    :passenger_train
  end

  protected

  def correct_type?(carriage)
    raise 'Не тот тип вагонов!' unless carriage.type == :passenger_carriage
    true
  end
end
