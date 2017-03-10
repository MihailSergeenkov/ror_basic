class Program
  attr_accessor :stations, :trains

  def initialize
    @stations = []
    @trains = []
  end

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    stations << Station.new(name)
  end

  def create_train
    puts 'Введите название поезда:'
    name = gets.chomp
    puts 'Введите тип поезда: 1 - пассажирский, 2 - грузовой.'
    type = gets.chomp.to_i

    if type == 1
      create_passenger_train(name)
    elsif type == 2
      create_cargo_train(name)
    end
  end

  def add_carriage
    if trains.nil?
      puts 'Пока нет ни одного поезда!'
    else
      train = get_train

      if train.type == :passenger_train
        train.add_carriage(PassengerCarriage.new)
      elsif train.type == :cargo_train
        train.add_carriage(CargoCarriage.new)
      end
    end
  end

  def delete_carriage
    if trains.nil?
      puts 'Пока нет ни одного поезда!'
    else
      train = get_train
      train.carriages.empty? ? puts('У поезда нет вагонов!') : train.delete_carriage(train.carriages.last)
    end
  end

  def set_station_for_train
    if trains.nil?
      puts 'Пока нет ни одного поезда!'
    else
      train = get_train
      station = get_station
      train.current_station.delete_train(train) unless train.current_station.nil?
      train.current_station = station
      station.take_train(train)
    end
  end

  def stations_list
    stations.empty? ? puts('Пока нет ни одной станции!') : stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def train_list_on_station
    if stations.empty?
      puts 'Пока нет ни одной станции!'
    else
      station = get_station
      station.trains.empty? ? puts('На станции нет ни одного поезда!') : station.trains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
    end
  end

  private

  # Метод вызывается только внутри класса
  def create_passenger_train(name)
    trains << PassengerTrain.new(name)
  end

  # Метод вызывается только внутри класса
  def create_cargo_train(name)
    trains << CargoTrain.new(name)
  end

  # Метод вызывается только внутри класса
  def get_train
    trains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
    puts 'Введите порядковый номер поезда:'
    number = gets.chomp.to_i

    trains[number - 1]
  end

  # Метод вызывается только внутри класса
  def get_station
    stations_list
    puts 'Введите порядковый номер станции:'
    number = gets.chomp.to_i

    stations[number - 1]
  end
end
