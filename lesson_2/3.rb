number = 1
array = [0]

loop do
  array.push number
  number = array.last + array[-2]
  break if number >= 100
end

p array
