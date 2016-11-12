# !/usr/bin/env ruby
# coding: utf-8
# Alphabet

hash = {}
index = 0
('a'..'z').each do |char|
  index += 1
  hash[char.to_sym] = index if char =~ /[a,e,i,o,u]/
end

 p hash
