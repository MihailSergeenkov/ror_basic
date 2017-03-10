require_relative 'train.rb'
class CargoTrain < Train
  def type
    :cargo_train
  end

  protected

  # Метод add_carriage! определен в секции protected родительского класса
  def add_carriage!(carriage)
    carriage.type == :cargo_carriage ? super : puts('Не тот тип вагонов!')
  end
end
