#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorial.rb
# date: 2013.06.25
#++

# == Description
# benchmarks for different implementations of 'factorial'
#
# == Source
# http://rosettacode.org/wiki/Factorial#Ruby
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

require 'factorial'

def main args
  
  # baseline: 2432902008176640000
  
  n = 20
  
  ccode = CCode.new
  
  puts factorial_recursive(n)
  puts factorial_tail_recursive(n)
  puts factorial_iterative(n)
  puts factorial_inject(n)
  puts factorial_reduce(n)
  puts factorial_memoization(n)
  puts ccode.factorial(n)
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
