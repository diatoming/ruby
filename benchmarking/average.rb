#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# average.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# test class for studying benchmarking :)
#
# == Usage
# average.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Array < Object
  
  def average
    (inject :+).to_f / length
  end
  
  def average_thread
    sum_thread = Thread.new do 
      inject :+
    end  
    length_thread = Thread.new do 
      length
    end
    [sum_thread, length_thread].each do |t| 
      t.join 
    end
    sum_thread.value.to_f / length_thread.value
  end
    
end


def main args
  a = (0..100).to_a
  
  p a.average
  p a.average_thread
  
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
