#--
# Have faith in the way things are.
#
# lib_rctao.rb
# current v.:  0.0.1
# date: 2013.04.14
#++

# == Description
# this modules encapsulates the functionality related to the reading
# of the Tao Te Ching in stdio
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.
module LibRctao
  
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
      puts "*** Section #{File.basename @section_file_path, \
      SECTION_FILE_EXT} ***\n\n"
      puts File.read @section_file_path
    end
  end
  
end


# little test
if $0 == __FILE__
  begin
    reader = LibRctao::TaoReader.new 10
    reader.enlight_me
    0
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end

