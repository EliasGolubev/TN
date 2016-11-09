# !/usr/bin/env ruby
# coding: utf-8
# Quadratic equation
print "[Console] Введите первый коэфициент уравнения(a): "
first_coefficient = gets.to_f

print "[Console] Введите второй коэфициент уравнения(b): "
second_coefficient = gets.to_f

print "[Console] Введите третий коэфициент уравнения(c): "
third_coefficient = gets.to_f

discriminant = second_coefficient**2 - 4*first_coefficient*third_coefficient

if discriminant < 0
  puts "[Console] Корней нет!"
else
  square_root = Math.sqrt(discriminant)
  
  x1 = (square_root - second_coefficient) / 2 * first_coefficient
  
  if discriminant == 0
    puts "[Console] Корень уравнения : #{x1}"
  else
    x2 = (-square_root - second_coefficient) / 2 * second_coefficient
    puts "[Console] Корни уравнения : #{x1} и #{x2}"
  end
end