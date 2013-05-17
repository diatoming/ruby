#!/usr/local/bin/ruby
# Have faith in the way things are.

# rcfactorial.rb
# return the factorial of a given integer
# Copyright 2012 RimbaudCode
# License: GPLv3+

def usage
  puts 'Return the factorial of a given integer (n)'
  puts "usage: #{File.basename $0, '.rb'} n"
  exit 0
end


if $0 == __FILE__  
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

    require 'rcisnum'
    require 'lib_rcfactorial'

    n = $*.shift
    
    usage if n.nil?
    
    NonNumericValueError = Class.new StandardError
    raise NonNumericValueError unless n.is_int?
    p n.to_i._!
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
