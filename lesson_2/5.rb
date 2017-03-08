puts 'Введите число даты:'
day = gets.chomp.to_i

puts 'Введите месяц даты:'
month = gets.chomp.to_i

puts 'Введите год даты:'
year = gets.chomp.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap_year = (year % 400).zero? || (year % 4).zero? && !(year % 100).zero?
month_days = days.take(month - 1).inject(0) { |sum_days, m| sum_days + m }

sum_days = month_days + day
sum_days += 1 if leap_year && month >= 3

puts "Номер даты - #{sum_days}"
