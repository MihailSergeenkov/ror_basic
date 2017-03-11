require_relative 'train.rb'
class CargoTrain < Train
  def type
    :cargo_train
  end

  protected

  # Метод correct_type? определен в секции protected родительского класса
  def correct_type?(carriage)
    carriage.type == :cargo_carriage
  end
end
