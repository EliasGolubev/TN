# !/usr/bin/env ruby
# coding: utf-8
# leap

hash = {}
hash[:yday] = 0
arr_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print '[Console] Введите год: '
hash[:year] = gets.to_i

print '[Console] Введите месяц: '
hash[:month] = gets.to_i

print '[Console] Введите число: '
hash[:day] = gets.to_i

hash[:leap] = (hash[:year] % 400).zero? || (hash[:year] % 4).zero? ? true : false

arr_day[1] = hash[:leap] == true ? 29 : 28

count = 1
while count <= 12
  if hash[:month] == count
    hash[:yday] += hash[:day]
    break
  else
    hash[:yday] += arr_day[count]
    count += 1
  end
end

puts "[Console] Это #{hash[:yday]} день в этом году"
