#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tau.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# returns the tau number, 2 * pi, using hi-precision arithmetics
#
# == Usage
# tau.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

def usage
  puts 'Return the Tau number'
  puts "usage: #{File.basename $0, '.rb'}" 
  exit 0
end

if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))
    
    require 'is-num'
    require 'tau'
    
    usage if $*.nil?
    
    p Math::tau.to_s('F')
    
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
