#!/usr/bin/env ruby -wKU
# encoding: UTF-8
# Have faith in the way things are.

# rctau.rb
# returns the tau number, 2 * pi, using hi-precision arithmetics
# expected value:
# 6.2831853071795864769252867665590056
# Copyright 2012 RimbaudCode
# License: GPLv3+

def usage
  puts 'Return the Tau number'
  puts "usage: #{File.basename $0, '.rb'}" 
  exit 0
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')
    
    require 'rcisnum'
    require 'lib_rctau'
    
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
