#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# pdf2txt.rb
# date: 2013.07.22
#++

# == Description
# read pdfs and write the content to txt files
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'pdf2txt'

def main args
  pdf_file_name = $*.shift
  usage if pdf_file_name.nil?
  reader = PDF2TXT.new "tao-te-ching.pdf"
  puts "reading pdf..."
  puts "writing to txt..."
  reader.write_to_txt
  puts "done..."
  exit
end

def usage
  puts 'Read the contents of a PDF file and write them to a txt file'
  puts "usage: #{File.basename $0, '.rb'} [pdf_file_name]"
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
