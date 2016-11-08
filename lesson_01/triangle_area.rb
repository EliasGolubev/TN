# !/usr/bin/env ruby
# coding: utf-8
# Triangle area
print "[Console] Введите основание треугольника(a): "
triangle_base = gets.to_f

print "[Console] Введите высоту треугольника(h): "
triangle_height = gets.to_f

triangle_area = 1/2.0 * triangle_base * triangle_height

puts "[Console] Площадь треугольника равна #{triangle_area}"