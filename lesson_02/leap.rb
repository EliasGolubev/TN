# !/usr/bin/env ruby
# coding: utf-8
# leap

yday = 0
arr_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print '[Console] Введите год: '
year = gets.to_i

print '[Console] Введите месяц: '
month = gets.to_i

print '[Console] Введите число: '
day = gets.to_i

leap = 29 if (year % 400).zero? || (year % 4).zero?

arr_day[1] = leap

count = 1
while count <= 12
  if month == count
    yday += day
    break
  else
    yday += arr_day[count]
    count += 1
  end
end

puts "[Console] Это #{yday} день в этом году"
