#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tao.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# read a chapter of the Tao Te Ching in stdio
#
# == Usage
# tao.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

module Tao
  
  class TaoReader < Object
    # tao-te-ching folder path relative to this script path!
    TAO_TE_CHING_REL_DIR = '../tao-te-ching-book'
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
      puts "*** Section #{@section} ***\n\n"
      puts File.read @section_file_path
    end
    
    # returns current tao section
    # input:  none
    # output: str with current section
    def read_section
      File.read @section_file_path
    end
  end
end
