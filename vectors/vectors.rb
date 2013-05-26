#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# vectors.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# playing with vectors
#
# == Usage
# vectors.rb [opts]
#
# == Example
# 
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

require 'matrix'

# init vectors from arrays
a = [1, 2, 3]
u = Vector.elements a
p u

# init vector directly
v = Vector.[](4, 5, 6)
p v

# access elements
# vectors are 0-based!
p v.[](1)

# vector operations
p u + v
p v.magnitude
p v.norm
p v.normalize
p u.inner_product v

