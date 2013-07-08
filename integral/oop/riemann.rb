#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# riemann.rb
# date: 2013.07.08
#++

# == Description
# riemann sums model
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

class RiemannSum < Object
  
  require 'interval'
  require 'parable'
  
  @interval
  @parable
  
  
  
end

if $0 == __FILE__
  begin
    require 'pp'
    require 'interval'
    require 'parable'
    
    interval = Interval.new 0.0, 1.0
    parable = Parable.new
    
    parable.interval = interval
    parable.divide_interval_into_parts 10
    parable.abscissas_for_partition
    parable.ordinates_for_partition
    pp parable.abscissas_and_ordinates
    
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

