#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# rctao.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# display a random section of the Tao Te Ching in stdio
#
# == Usage
# rctao.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

MIN_SECTION_NUMBER = 1
MAX_SECTION_NUMBER = 81

def main args
  usage if $*.length > 0
  reader  = LibRctao::TaoReader.new generate_section_number
  reader.enlight_me
  0
end


# generate the number of the section to read, based on a 
# generated pseudo-random number between 1 and 81 (included)
# input:  none
# output: integer from 1 to 81
def generate_section_number
  Random.new.rand(MIN_SECTION_NUMBER..MAX_SECTION_NUMBER)
end

def usage
  puts 'display a random section of the Tao Te Ching'
  puts "usage: rctao.rb"
  exit 0
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << './../lib')

    require 'tao'
    
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
