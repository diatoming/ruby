#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# nist_parser.rb
# current v.: 0.0.1
# date: 2013.06.02
#++

# == Description
# parser for the NIST 'Fundamental Physical Constants' file
#
# == Usage
# nist_parser.rb [opts]
#
# == Source - NIST data; ie, physical constants value:
# NIST: Fundamental Physical Constants --- Complete Listing
# http://physics.nist.gov/cuu/Constants/Table/allascii.txt
#
# == Source - code:
# http://stackoverflow.com/questions/6012930/read-lines-of-a-file-in-ruby
# http://www.ruby-forum.com/topic/150090
# http://stackoverflow.com/questions/9614520/skipping-the-first-line-when-reading-in-a-file-in-1-9-3
# http://zetcode.com/lang/rubytutorial/hashes/
# http://www.skorks.com/2010/04/serializing-and-deserializing-objects-with-ruby/
# http://stackoverflow.com/questions/15080854/read-and-write-json-and-maintain-the-formatting-in-ruby
# http://stackoverflow.com/questions/5507512/write-to-json-file-in-correct-format-ruby
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class NistParser < Object
  
  # the NIST file begins with a 10-line header
  HEADER_LINE_SIZE = 10
  
  def initialize nist_file
    @nist_file = File.absolute_path(File.expand_path nist_file)
  end
  
  def to_json
    @nist_data = {}

    File.open(@nist_file, 'r').drop(HEADER_LINE_SIZE).each do |line| 
      name = line[0...60].strip
      value = line[60...85].strip
      uncertainty = line[85...110].strip
      unit = line[110...180]
      if unit.nil? or unit.empty?
        unit = '1'
      else
        unit = unit.strip
      end
      @nist_data[name] = [value, uncertainty, unit]
    end
    @nist_data
  end
  
  def to_json_path path
    require 'json'
    
    self.to_json    

    File.open path, 'w' do |file| 
      file.write JSON.pretty_generate @nist_data
    end
  end
  
end


=begin
def main args
  nist_file_path = './nist.txt'
  parser = NistParser.new nist_file_path
  parser.to_json_file
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
=end
