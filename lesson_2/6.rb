product_hash = {}

loop do
  puts 'Введите название товара (или стоп для окончания ввода):'
  product_name = gets.chomp

  break if product_name == 'стоп'

  puts 'Введите цену товара за единицу:'
  product_price = gets.chomp.to_f

  puts 'Введите кол-во товара:'
  product_quantity = gets.chomp.to_f

  product_hash[product_name] = { product_price: product_price, product_quantity: product_quantity, product_sum: product_price * product_quantity }
end

p product_hash

total = product_hash.inject(0) { |sum, product| sum + product[1][:product_sum] }

puts "В корзине продуктов на - #{total} рублей"
