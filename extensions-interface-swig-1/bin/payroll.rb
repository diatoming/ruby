#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# payroll.rb
# released: Thu Dec 25 20:32:23 CET 2014
#++

#== Description
# ruby extensions with swig
#
#== Run
# $ ruby ./payroll.rb
#
#== Author
# rimbaud1854
#
#== Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# payroll.rb

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'libpayroll'

p Libpayroll.calculate_sui_tax(9000, 0.34)
