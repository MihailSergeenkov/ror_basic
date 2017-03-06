puts 'Введите длины сторон треугольника.'
puts 'Введите длину первой стороны треугольника:'
first = gets.chomp.to_i

puts 'Введите длину второй стороны треугольника:'
second = gets.chomp.to_i

puts 'Введите длину третьей стороны треугольника:'
third = gets.chomp.to_i

array = [first, second, third].sort

result = if array[0]**2 + array[1]**2 == array[2]**2 && array[0] == array[1]
  'Треугольник прямоугольный и равнобедренный'
elsif array[0]**2 + array[1]**2 == array[2]**2
  'Треугольник прямоугольный'
else
  'Треугольник непрямоугольный'
end

puts result
