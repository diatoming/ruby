#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fibonacci.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# return a list of Fibonacci numbers given up to a given max int
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Array < Object
  
  def fib_up_to max
    raise RangeError unless max > 0
    n1, n2 = 1, 1
    while n1 <= max
      self << n1
      n1, n2 = n2, n1 + n2
    end
      self
  end
  
end


if $0 == __FILE__
  begin
    a = []
    a.fib_up_to 10
    p a
    0
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end

