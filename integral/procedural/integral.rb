#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# integral.rb
# date: 2013.07.05
#++

# == Description
# value of the integral of x^2 by means of Riemann sums
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

a = 0.0
b = 1.0
number_of_subintervals = 1_000_000

#
interval = (a..b)

# norm of the partition
delta_x = (b - a) / number_of_subintervals

# partition the interval
partition = interval.step(delta_x).to_a
#p partition

# calculate f(x_i)
function_values = []
partition.each do |point|  
  function_values << (point)**2
end
#p function_values

# calculate area
area = delta_x * (function_values.inject :+)
p area
