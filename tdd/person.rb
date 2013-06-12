#!/usr/bin/env ruby -wKU
# encoding: UTF-8
# Have faith in the way things are.
#
# person.rb
# class representing a person
# Copyright 2012 RimbaudCode
# License: GPLv3+

class Person

  attr_accessor :firstname, :lastname
  attr_reader :age

  def name
    @firstname + " " + @lastname
  end

  def age=(val)
    raise RangeError if val > 200
    raise RangeError if val < 0
    @age = val
  end

end
