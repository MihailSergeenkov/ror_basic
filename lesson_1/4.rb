puts 'Введите коэффициенты квадратного уравнения.'
puts 'Введите коэффициент - a:'
a = gets.chomp.to_f

puts 'Введите коэффициент - b:'
b = gets.chomp.to_f

puts 'Введите коэффициент - c:'
c = gets.chomp.to_f

d = b**2 - 4 * a * c

result = if d < 0
  "Дискриминант = #{d}, корней нет!"
elsif d == 0
  "Дискриминант = 0, корень = #{-b/(2 * a)}"
else
  "Дискриминант = #{d}, первый корень = #{(-b + Math.sqrt(d))/(2 * a)}, второй корень = #{(-b - Math.sqrt(d))/(2 * a)}"
end

puts result
