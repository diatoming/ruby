#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# rand-letter.rb
# date: 2013.07.12
#++

# == Description
# return a random letter of the English alphabet
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# 97 = a and 122 = z in ASCII
p rand(97..122).chr
