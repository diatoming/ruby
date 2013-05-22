#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# zeroes.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# fill an array with zeroes
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

NonStrictPositiveIntegerValueError = Class.new StandardError
WrongArrayLengthError = Class.new StandardError

class Array < Object
  
  def fill_with_n_zeros n
    raise NonStrictPositiveIntegerValueError if n <= 0
    self.clear
    self.fill 0, 0..(n - 1)
    raise WrongArrayLengthError unless self.length == n
    self
  end
  
end


def main args
  a = []
  a.fill_with_n_zeros 10
  p a
  p a.length
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



