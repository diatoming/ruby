#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# look_up-table.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# build a factorials look_up table
#
# == Usage
# factorials.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'json'
require './factorials'

def main args
  
  n_min = 0
  n_max = 1000
  
  look_up_table_file = './look_up.json'
  
  look_up = {}
  range   = (n_min..n_max)
  range.each do |num| look_up[num] = num._! end
  
  File.open look_up_table_file, 'w' do |file| 
    file.write JSON.pretty_generate look_up
  end
  
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
