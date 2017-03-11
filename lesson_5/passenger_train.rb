require_relative 'train.rb'
class PassengerTrain < Train
  def type
    :passenger_train
  end

  protected

  # Метод correct_type? определен в секции protected родительского класса
  def correct_type?(carriage)
    carriage.type == :passenger_carriage
  end
end
