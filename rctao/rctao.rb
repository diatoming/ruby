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

class TaoReader < Object
  
  # tao-te-ching folder path relative to this script path!
  TAO_TE_CHING_REL_DIR = './tao-te-ching'
  SECTION_FILE_EXT     = '.txt'
  
  def initialize section
    @section = section.to_s
    # path to this script + tao folder path + section + extension :)
    @section_file_path = File.absolute_path(File.dirname(__FILE__) \
    + File::SEPARATOR + TAO_TE_CHING_REL_DIR \
    + File::SEPARATOR + @section + SECTION_FILE_EXT)
  end
  
  # read tao section
  # input:  none
  # output: section read in stdio
  def enlight_me
    puts "Tao Te Ching, Lao Tzu\n\n"
    puts "*** Section #{File.basename @section_file_path, \
    SECTION_FILE_EXT} ***\n\n"
    puts File.read @section_file_path
  end
  
end

# generate the number of the section to read, based on a 
# generated pseudo-random number between 1 and 81 (included)
# input:  none
# output: integer from 1 to 81
def generate_section_number
  rand 0..81
end


def main args
  usage if $*.length > 0
  reader  = TaoReader.new generate_section_number
  reader.enlight_me
  0
end


def usage
  puts 'display a random section of the Tao Te Ching'
  puts "usage: rctao.rb"
  exit 0
end


if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
