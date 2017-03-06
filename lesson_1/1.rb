puts 'Введите Ваше имя:'
name = gets.chomp.capitalize

puts 'Введите Ваш рост:'
height = gets.chomp.to_i

ideal_weight = height - 110

puts ideal_weight < 0 ? "Ваш вес уже оптимальный" : "#{name}, Ваш идеальный вес - #{ideal_weight}"
