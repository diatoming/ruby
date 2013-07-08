#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# look-up-table.rb
# date: 2013.07.02
#++

# == Description
# description
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

require 'factorial'

range = (0..20)

range.each do |num| puts "@#{num} : @#{num._!}," end

