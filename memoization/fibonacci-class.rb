#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fibonacci-class.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# fibonacci series calculated with memoization
#
# == Usage
# fibonacci_class.rb
#
# == Installation
# $ sudo gem install Memoize
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Maths < Object
  
  def Maths.fib n
    return 1 if n < 2
    fib(n - 1) + fib(n - 2)
  end
  
  require 'Memoize'
  Memoize.register Maths, 'fib'
  
end


def main args
  
  range = (0..20)
  array = []
  range.each do |num| array << (Maths::fib num) end
  
  p array
  
  exit
end

if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
