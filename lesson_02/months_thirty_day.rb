# !/usr/bin/env ruby
# coding: utf-8
# Months 30 day
require 'date'

year = Date.today.year
month_box = Date::MONTHNAMES.join(" ").split(" ")
day_box = []
month_hash = {}

(1..12).each do |month|  
  if month != 2  
    Date.valid_date?(year, month, 31) ? day_box.push(31) : day_box.push(30)
  else
    Date.leap?(year) ? day_box.push(29) : day_box.push(28)
  end
end
 
day_box.each_index do |index| 
  month_hash[month_box[index].to_sym] = { day: day_box[index] }
end

month_hash.each do |key, value| 
  puts "[Console] #{key} : #{value[:day]} day" if value[:day] == 30
end