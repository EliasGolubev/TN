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
		x1 = (Math.sqrt(discriminant) - second_coefficient) / 2 * first_coefficient
		x2 = (-Math.sqrt(discriminant) - second_coefficient) / 2 * second_coefficient
		if x1 == x2
			puts "[Console] Корень уравнения : #{x1}"
		else
			puts "[Console] Корни уравнения : #{x1} и #{x2}"
		end
end


