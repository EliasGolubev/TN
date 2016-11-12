# !/usr/bin/env ruby
# coding: utf-8
# Basket

basket = {}

puts '[Console] Для окочания покупок введите стоп'

loop do
  print '[Console] Введите название товара: '
  name = gets.chomp
  puts "[Console] Изменение товара #{name}" if basket.include?(name.to_sym)
  break if name == 'стоп'
 
  print '[Console] Введите цену: '
  price = gets.chomp
  break if price == 'стоп'
  
  print '[Console] Введите количество товара: '
  num = gets.chomp
  break if num == 'стоп'
  basket[name.to_sym] = { price: price.to_f, num: num.to_i }
end

sum = 0
basket.each do |key, value|
  result = value[:price] * value[:num]
  puts "[Console] Итоговая сумма за товар #{key}: #{result}"
  sum += result
end

puts basket
puts "[Console] К оплате #{sum}"
