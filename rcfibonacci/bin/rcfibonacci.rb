#!/usr/local/bin/ruby -w
# Have faith in the way things are.

# rcfibonacci.rb
# return a list of Fibonacci numbers given up to a given max int
# Copyright 2012 RimbaudCode
# License: GPLv3+

def usage
  puts 'Return the Fibonacci series up to a given maximum'
  puts "usage: #{File.basename $0, '.rb'} max"
  exit 0
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

    require 'rcisnum'
    require 'lib_rcfibonacci'

    NonNumericValueError = Class.new StandardError

    n = $*.shift
    
    usage if n.nil?

    raise NonNumericValueError unless n.is_int?

    p [].fib_up_to n.to_i

  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
