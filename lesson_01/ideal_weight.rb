# !/usr/bin/env ruby
# coding: utf-8
# ideal weight
print "[Console] Введите имя: "
name = gets.chomp
name.capitalize!

print "[Console] Введите ваш рост: "
height = Integer(gets.chomp)

ideal_weight = height - 110

if ideal_weight < 0
  puts "[Console] Ваш вес уже оптимальный"
else
  puts "[Console] #{name}, ваш идеальный вес #{ideal_weight}"
end
