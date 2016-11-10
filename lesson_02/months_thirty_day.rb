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
    Date.valid_date?(year, month, 31) ? day_case.push(31) : day_case.push(30)
  else
    Date.leap?(year) ? day_case.push(29) : day_case.push(28)
  end
end
 
day_case.each_index do |index| 
  month_hash[month_case[index].to_sym] = { day: day_case[index] }
end

month_hash.each do |key, value| 
  puts "#{key} have #{value[:day]}" if value[:day] == 30
end