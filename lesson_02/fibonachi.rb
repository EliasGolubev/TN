# !/usr/bin/env ruby
# coding: utf-8
# Array Fibonachi

fib = ->(x, y) { return x + y }
arr = []

(0..100).each do |pos|
  if pos.zero?
    arr.push(0)
  elsif pos == 1
    arr.push(1)
  else
    arr << fib.call(arr[pos - 1], arr[pos - 2])
  end
end

arr.delete(0)

# p arr

