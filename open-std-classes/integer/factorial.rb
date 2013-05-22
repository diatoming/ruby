#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorial.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# calculate factorials with memoization
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Integer < Object
  
  @@kfact = {0 => 1, 1 => 1}

  def _!
    test = @@kfact.include? self
    case
      when test then r = @@kfact[self]
      when !test then r = (self - 1)._! * self ; @@kfact[self] = r
    end
    r
  end
  
  # express factorials in scientific notation
  def to_sci
    ("%E" % self).to_f
  end
  
end


def main args
  p 10._!
  p 100._!
  p 100._!.to_sci
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

