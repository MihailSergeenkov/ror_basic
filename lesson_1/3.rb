puts 'Введите длины сторон треугольника.'
puts 'Введите длину первой стороны треугольника:'
first = gets.chomp.to_f

puts 'Введите длину второй стороны треугольника:'
second = gets.chomp.to_f

puts 'Введите длину третьей стороны треугольника:'
third = gets.chomp.to_f

if first == second && second == third && first && third
  result_equilateral = 'Треугольник равносторонний'
  result_rectangular = 'Треугольник непрямоугольный'
else
  array = [first, second, third].sort

  rectangular = array[0]**2 + array[1]**2 == array[2]**2

  result_rectangular = rectangular ? 'Треугольник прямоугольный' : 'Треугольник непрямоугольный'

  result_equilateral = array[0] == array[1] || array[1] == array[2] || array[0] == array[2] ? 'Треугольник равнобедренный' : 'Треугольник неравнобедренный'
end

puts result_rectangular
puts result_equilateral
