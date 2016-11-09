# !/usr/bin/env ruby
# coding: utf-8
# Right triangle
print "[Console] Введите первую сторону треугольника: "
first_side = gets.to_f

print "[Console] Введите вторую сторону треугольника: "
second_side = gets.to_f

print "[Console] Введите третью сторону треугольника: "
third_side = gets.to_f

sides = [first_side, second_side, third_side]
hypotenuse = sides.delete(sides.max)

if sides.empty?
  equilateral = true
elsif sides.length == 1
  isosceles = true
else
  isosceles = sides.uniq.length != sides.length ? true : false
  rectangular = hypotenuse**2 == sides[0]**2 + sides[1]**2 ? true : false
end

text = []
equilateral == true ? text << "Равносторонний" : text << "Не равносторонний"
isosceles == true ? text << "Равнобедренный" : text << "Не равнобедренный"
rectangular == true ? text << "Прямоугольный" : text << "Не прямоугольный"

print "[Console] Треугольник: "
puts text.join(" | ")