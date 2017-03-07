puts 'Введите длины сторон треугольника.'
puts 'Введите длину первой стороны треугольника:'
first = gets.chomp.to_f

puts 'Введите длину второй стороны треугольника:'
second = gets.chomp.to_f

puts 'Введите длину третьей стороны треугольника:'
third = gets.chomp.to_f

array = [first, second, third].sort

result_equilateral = if array.uniq.size == 1
  'Треугольник равносторонний'
elsif array.uniq.size == 2
  'Треугольник равнобедренный'
else
  'Треугольник неравнобедренный'
end

rectangular = array[0]**2 + array[1]**2 == array[2]**2
result_rectangular = rectangular ? 'Треугольник прямоугольный' : 'Треугольник непрямоугольный'

puts result_rectangular
puts result_equilateral
