#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# main.rb
# v.: 0.0.1
#++

# == Description
# description
#
# == Usage
# ruby main.rb [opts]
#
# == Example
# 
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

# libs here

def main args
  # code here
  0
end

# helper methods here


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
