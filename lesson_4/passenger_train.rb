require_relative 'train.rb'
class PassengerTrain < Train
  def type
    :passenger_train
  end

  protected
  
  # Метод add_carriage! определен в секции protected родительского класса
  def add_carriage!(carriage)
    carriage.type == :passenger_carriage ? super : puts('Не тот тип вагонов!')
  end
end
