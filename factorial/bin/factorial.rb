#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorial.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# factorial numbers
#
# == Usage
# factorial.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'factorial'

def main args
  input = $*.shift
  usage if input.nil?
  raise NonNumericValueError unless input.is_int?
  p input.to_i._!
  exit
end

def usage
  puts 'Return the factorial of an integer'
  puts "usage: #{File.basename $0, '.rb'} [integer]"
  exit
end

NonNumericValueError = Class.new StandardError

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

