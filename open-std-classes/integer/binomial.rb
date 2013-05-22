#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# binomial.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# calculate binomial coefficient or n choose k
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

KValueBiggerThanNError = Class.new StandardError

class Integer < Object
  
  require "./factorial"
  
  # n choose k (binomial coefficient): n == self
  def choose k
    raise KValueBiggerThanNError if k > self
    _! / ((self - k)._! * k._!)
  end
  
end


def main args
  p 10.choose 5
  0
end

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

