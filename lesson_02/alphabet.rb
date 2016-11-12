# !/usr/bin/env ruby
# coding: utf-8
# Alphabet

hash = {}
REG_VOWEL = /[a,e,i,o,u]/

('a'..'z').each_with_index do |char, index|
  hash[char.to_sym] = index + 1 if char =~ REG_VOWEL
end

# p hash
