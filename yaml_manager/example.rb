#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# example.rb
# v.: 0.0.1
#++

# == Description
# example on how to use YAMLManager
#
# == Usage
# ruby example.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

require './lib/yaml_manager'

filename  = 'test.txt'
data      = {one: 'string', two: 'another string'}

manager = YAMLManager::Manager.new
manager << filename
manager.write_data data
p manager.read_data

