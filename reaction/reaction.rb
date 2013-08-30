#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# reaction.rb
# date: 2013.08.27
#++

# == Description
# modeling a first-order chemical reaction in a batch reactor
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'pp'

init_time = 0.0
end_time  = 1.0
time_step = 0.1

alpha = 1.0

time_discretization = (init_time..end_time).step time_step
concentration = time_discretization.map do |time|
    Math::exp(alpha * time)
  end

curve = time_discretization.zip concentration
pp curve
