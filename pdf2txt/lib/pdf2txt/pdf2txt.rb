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

class PDF2TXT < Object
  
  require 'pdf-reader'
  
  def initialize pdf_file_name
    @out_file_name = File.basename(pdf_file_name, 'pdf') + 'txt'
    @pdf_reader    = PDF::Reader.new pdf_file_name
  end
  
  def print_pdf_info
    puts @pdf_reader.pdf_version
    puts @pdf_reader.info
    puts @pdf_reader.metadata
    puts @pdf_reader.page_count
  end
  
  def write_to_txt
    File.open @out_file_name, 'w' do |file| 
      @pdf_reader.pages.each do |page|
        file.write page.text
      end
    end
  end
  
end

if $0 == __FILE__
  begin
    reader = PDF2TXT.new "tao-te-ching.pdf"
    reader.print_pdf_info
    reader.write_to_txt
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
