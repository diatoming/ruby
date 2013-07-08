#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# parable.rb
# date: 2013.07.05
#++

# == Description
# parable model
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

class Parable < Object
  
  require 'interval'
  
  attr_accessor :interval
  
  @interval
  @abscissas
  @ordinates
  @abscissas_and_ordinates
  @area
  
  def divide_interval_into_parts parts
    @interval.subinterval_number = parts
  end
  
  def abscissas_for_partition
    @interval.partition_norm
    @abscissas = @interval.partition_values
  end
  
  def ordinate_for_abscissa abscissa
    abscissa * abscissa
  end
  
  def ordinates_for_partition
    @ordinates = @abscissas.map do |x| 
      self.ordinate_for_abscissa x
    end
  end
  
  def abscissas_and_ordinates
    @abscissas_and_ordinates = Hash[@abscissas.zip(@ordinates)]
  end
  
end


if $0 == __FILE__
  begin
    require 'pp'
    require 'interval'
    
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

