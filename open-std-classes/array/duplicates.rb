#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# duplicates.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# find duplicates in arrays
#
# == Sources
# duplicates?
# http://stackoverflow.com/questions/4351390/\
# how-do-i-check-an-array-for-duplicates
#
# duplicates
# http://stackoverflow.com/questions/8921999/\
# ruby-how-to-find-and-return-a-duplicate-value-in-array
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Array
  
  # are there duplicates?
  # returns true if there are duplicates
  # returns false otherwise
  def duplicates?
    not (self.uniq.length == self.length)
  end
  
  # return an array of duplicate objects
  # if no duplicates are found, return the empty array
  def duplicates
    self.group_by do |e| e end.select do |k, v| v.size > 1 end.map(&:first)
  end
  
end


def main args
  a = [0, 0, 1]
  p a.duplicates?
  p a.duplicates

  a = [0, 0, 1, 1, 'a', 'a', 'b']
  p a.duplicates?
  p a.duplicates

  a = [0, 1, 2, 'b']
  p a.duplicates?
  p a.duplicates
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

