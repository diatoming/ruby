#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# binomial.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# return n choose k (binomial coefficient)
#
# == Usage
# binomial.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

require 'is-num'
require 'binomial'

def usage
  puts 'Return n choose k (binomial coefficient)'
  puts "usage: #{File.basename $0, '.rb'} n k" 
  exit 0
end

if $0 == __FILE__
  begin
    n, k = $*.shift, $*.shift
    
    usage if k.nil?
        
    NonNumericValueError = Class.new StandardError
    raise NonNumericValueError unless n.is_int? and k.is_int?
    
    n, k = n.to_i, k.to_i
    p n.choose k
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
