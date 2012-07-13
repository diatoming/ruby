#!/usr/local/bin/ruby -w
# Have faith in the way things are.

# ddg.rb
# DuckDuckGo Zero Click Info API
#--
# Copyright 2012 RimbaudCode
# Licensed under GPLv3+. No warranty is provided.
#++

require 'duck_duck_go'

def usage
  puts 'search info with duck duck go'
  puts "usage: #{File.basename $0, '.rb'} search_term(s)"
  exit 0
end

usage unless $*.nil?

zci = DuckDuckGo.new.zeroclickinfo($*.join(' '))

puts zci.heading
puts zci.abstract_text
