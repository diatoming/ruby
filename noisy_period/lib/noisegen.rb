#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# noisegen.rb
# date: 2014.07.17
#++

# == Description
# generates noise using random numbers
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class NoiseGen < Object
  
  attr_accessor :lo_bound
  attr_accessor :hi_bound
  
  def initialize lo_bound, hi_bound
    @lo_bound = lo_bound
    @hi_bound = hi_bound
  end
  
  def noise
    rand(self.lo_bound..self.hi_bound)
  end
  
end


def main args
  lo_bound = -0.1
  hi_bound = 0.1
  noise_gen = NoiseGen.new(lo_bound, hi_bound)
  10.times do p noise_gen.noise end
  exit
end


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

