#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# binomial.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# binomial coefficient
#
# == Usage
# binomial.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

require 'factorial'

class Integer
  
  KValueBiggerThanNError = Class.new StandardError
  
  # n choose k (binomial coefficient): n == self
  def choose k
    raise KValueBiggerThanNError if k > self
    _! / ((self - k)._! * k._!)
  end
  
  # convert factorials into scientific notation
  def to_sci
    ("%E" % self).to_f
  end

end
