#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# interval.rb
# date: 2013.07.05
#++

# == Description
# interval class
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Interval < Object
  
  @lower_bound
  @upper_bound
  @subinterval_number
  @partition_norm
  @partition_values
  
  attr_accessor :subinterval_number
  
  def initialize lower_bound, upper_bound
    @lower_bound = lower_bound
    @upper_bound = upper_bound
  end
    
  def partition_norm
    @partition_norm = (@upper_bound - @lower_bound) / @subinterval_number
  end
  
  def partition_values
    @partition_values = (@lower_bound..@upper_bound).step(@partition_norm).to_a
  end
    
end


if $0 == __FILE__
  begin
    interval = Interval.new 0.0, 1.0
    interval.subinterval_number = 10
    interval.partition_norm
    p interval.partition_values
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

