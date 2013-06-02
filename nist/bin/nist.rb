#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# nist.rb
# current v.: 0.0.1
# date: 2013.06.02
#++

# == Description
# download, parse and save NIST Fundamental Physical Constants data
#
# == Usage
# nist.rb
#
# == Source - constants:
# NIST: Fundamental Physical Constants --- Complete Listing
# http://physics.nist.gov/cuu/Constants/Table/allascii.txt
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'downloader'
require 'nist_parser'

def main args
  nist_data_url = 'http://physics.nist.gov/cuu/Constants/Table/allascii.txt'
  
  nist_file_path = '../data/nist.txt'
  json_file_path = '../data/nist.json'
  
  nist_data_str = String.with_contents_of_url nist_data_url
  nist_data_str.write_to_path nist_file_path
  
  parser = NistParser.new nist_file_path
  parser.to_json_path json_file_path
  
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
