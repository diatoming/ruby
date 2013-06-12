#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fibonacci.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# fibonacci series with memoization
#
# == Usage
# fibonacci-func.rb
#
# == Installation
# $ sudo gem install memoize
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

def fibonacci n
  if n == 0 or n == 1
    1 
  else
    fibonacci(n - 2) + fibonacci(n - 1) 
  end
end


def main args
  
  require 'Memoize'
  
  Memoize.register self, 'fibonacci'
  
  array = []
  range = (0..20)
  range.each do |num| array << (fibonacci num) end
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
