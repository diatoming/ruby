#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# is-num.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# test if a string is numberic
#
# == Usage
# is-num.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


class String
  
  def is_float?
    !!Float(self) rescue false
  end
  
  def is_int?
    !!Integer(self) rescue false
  end
  
end

if $0 == __FILE__
  begin
    puts "".is_int?
    puts "1".is_int?
    puts "".is_float?
    puts "1.0".is_float?
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

