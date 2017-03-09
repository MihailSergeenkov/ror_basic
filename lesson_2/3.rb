number = 1
array = [0]

while number < 100
  array << number
  number = array.last + array[-2]
end

p array
