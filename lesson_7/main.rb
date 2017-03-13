require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'program.rb'
require_relative 'nameable.rb'
require_relative 'validatable.rb'

puts '======================='
puts '--- Железная дорога ---'

main = Program.new

loop do
  puts '--------------'
  puts 'Введите необходимое число:'
  puts '1 - Создание станции'
  puts '2 - Создание поезда'
  puts '3 - Добавление вагона к поезду'
  puts '4 - Отцепление вагона к поезду'
  puts '5 - Поместить поезд на станцию'
  puts '6 - Просмотреть список станций'
  puts '7 - Просмотреть список поездов на станции'
  puts '8 - Просмотреть список вагонов у поезда'
  puts '9 - Занять место (объем) в вагоне'
  puts '0 - Выход'

  action_number = gets.chomp.to_i

  case action_number
  when 1
    main.create_station
  when 2
    main.create_train
  when 3
    main.add_carriage
  when 4
    main.delete_carriage
  when 5
    main.set_station_for_train
  when 6
    main.stations_list
  when 7
    main.train_list_on_station
  when 8
    main.carriage_list_for_train
  when 9
    main.take_carriage
  when 0
    break
  else
    next
  end
end

puts 'Спасибо!'
