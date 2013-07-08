#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# mkbook.rb
# date: 2013.07.02
#++

# == Description
# make the complete tao-te-ching book
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'json'
require 'tao'

book_file = './tao.json'
range = (1..81).to_a

dict_book = {}
range.each do |num| 
  tao_reader = Tao::TaoReader.new num
  dict_book[num] = tao_reader.read_section
end

File.open book_file, 'w' do |file| 
  file.write dict_book.to_json
end
