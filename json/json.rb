#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# json.rb
# current v.: 0.0.1
# date: 2013.05.26
#++

# == Description
# example on how to parse json data files
#
# == Usage
# json.rb
#
# == Sources
# http://www.tutorialspoint.com/json/json_ruby_example.htm
# http://ruby.about.com/od/tasks/a/The-Json-Gem.htm
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'rubygems'
require 'json'
require 'pp'

JSON_DATA = File.expand_path './employees.json'

json = File.read JSON_DATA
obj  = JSON.parse json

# pretty print
pp obj
