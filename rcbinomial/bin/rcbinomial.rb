#!/usr/local/bin/ruby -w
# Have faith in the way things are.

# rcbinomial.rb
# return n choose k (binomial coefficient)
#--
# Copyright 2012 RimbaudCode
# Licensed under GPLv3+. No warranty is provided.
#++

def usage
  puts 'Return n choose k (binomial coefficient)'
  puts "usage: #{File.basename $0, '.rb'} n k" 
  exit 0
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

    require 'rcisnum'
    require 'lib_rcbinomial'

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
