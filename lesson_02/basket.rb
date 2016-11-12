# !/usr/bin/env ruby
# coding: utf-8
# Basket

basket = {}

puts '[Console] Для окочания покупок введите стоп'

loop do
  print '[Console] Введите название товара: '
  name = gets.chomp
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
basket.each do |_key, value|
  sum += (value[:price] * value[:num])
end

puts basket
puts "[Console] К оплате #{sum}"
