#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# example.rb
# released: Thu Dec 25 20:54:48 CET 2014
#++

#== Description
# ruby extension with swig
#
#== Run
# $ ruby ./example.rb
#
#== Author
# rimbaud1854
#
#== Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'example'

p Example.fact 5
