#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# test.rb
# current v.: 0.0.1
# date: 2013.06.09
#++

# == Description
# test file for beautify
#
# == Usage
# works with ruby 1.8 not with 2.0
# /usr/bin/ruby test.rb
# the result is the original file modified and
# a backup of the original file
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Greeter < Object

  def initialize name, age
    @name =    name
    @age=age
  end

  def say_hi
    "hi!!!!"
  end

end

p 'this is a test'

greeter = Greet.new "a name", 13
p greeter.greet

