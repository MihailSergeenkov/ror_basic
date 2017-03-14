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
    puts 'Введите тип: 1 - пассажирский, 2 - грузовой, 3 - отменить создание.'
    type = gets.chomp.to_i

    create_passenger_train(name) if type == 1
    create_cargo_train(name) if type == 2
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e.message}... Повторите ввод..."
    retry
  end

  def add_carriage
    unless trains.nil?
      train = select_train

      if train.type == :passenger_train
        add_passenger_carriage(train)
      elsif train.type == :cargo_train
        add_cargo_carriage(train)
      end
    end
  end

  def delete_carriage
    unless trains.nil?
      train = select_train
      train.delete_carriage(train.carriages.last) unless train.carriages.empty?
    end
  end

  def set_station_for_train
    unless trains.nil?
      train = select_train
      station = select_station

      unless train.current_station.nil?
        train.current_station.delete_train(train)
      end

      train.current_station = station
      station.take_train(train)
    end
  end

  def stations_list
    stations.each_with_index { |station, i| puts "#{i + 1} - #{station.name}" }
  end

  def train_list_on_station
    unless stations.empty?
      station = select_station
      station.each_train do |train|
        puts <<-EOS
          Номер поезда    - #{train.number},
          тип             - #{train.type},
          кол-во вагонов  - #{train.number_of_carriages}
        EOS
      end
    end
  end

  def carriage_list_for_train
    return nil if trains.nil?
    train = select_train
    get_list_carriages(train)
  end

  def take_carriage
    unless trains.nil?
      train = select_train
      carriage = get_carriage(train)

      if carriage.type == :cargo_carriage
        take_cargo_carriage(carriage)
      elsif carriage.type == :passenger_carriage
        take_passenger_carriage(carriage)
      end
    end
  end

  private

  def create_passenger_train(name)
    trains << PassengerTrain.new(name)
  end

  def create_cargo_train(name)
    trains << CargoTrain.new(name)
  end

  def select_train
    trains.each_with_index { |train, i| puts "#{i + 1} - #{train.number}" }
    puts 'Введите порядковый номер поезда:'
    number = gets.chomp.to_i

    trains[number - 1]
  end

  def select_station
    stations_list
    puts 'Введите порядковый номер станции:'
    number = gets.chomp.to_i

    stations[number - 1]
  end

  def add_passenger_carriage(train)
    puts 'Введите кол-во мест в вагоне:'
    number = gets.chomp.to_i

    train.add_carriage(PassengerCarriage.new(number))
  end

  def add_cargo_carriage(train)
    puts 'Введите общий объем в вагоне:'
    volume = gets.chomp.to_f

    train.add_carriage(CargoCarriage.new(volume))
  end

  def get_list_carriages(train)
    if train.type == :cargo_train
      get_list_cargo_carriages(train)
    elsif train.type == :passenger_train
      get_list_passenger_carriages(train)
    end
  end

  def get_carriage(train)
    get_list_carriages(train)
    puts 'Введите номер вагона:'
    number = gets.chomp.to_i

    train.carriages.find { |carriage| carriage.object_id == number }
  end

  def get_list_cargo_carriages(train)
    train.each_carriage do |carriage|
      puts <<-EOS
        Номер вагона              - #{carriage.object_id},
        тип                       - #{carriage.type},
        кол-во свободного объема  - #{carriage.free_volume},
        кол-во занятого объема    - #{carriage.busy_volume}
      EOS
    end
  end

  def get_list_passenger_carriages(train)
    train.each_carriage do |carriage|
      puts <<-EOS
        Номер вагона              - #{carriage.object_id},
        тип                       - #{carriage.type},
        кол-во свободных мест     - #{carriage.number_of_free_seats},
        кол-во занятых мест       - #{carriage.number_of_busy_seats}
      EOS
    end
  end

  def take_cargo_carriage(carriage)
    puts 'Введите нужный объем в вагоне:'
    volume = gets.chomp.to_f

    carriage.take_volume(volume)
  end

  def take_passenger_carriage(carriage)
    carriage.busy_seat
  end
end
