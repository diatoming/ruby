#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# test_is-num.rb
# date: 2013.06.25
#++

# == Description
# testing is-num.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'test/unit'
require 'test_unit_extensions'
require 'factorial'

class TestIsNum < Test::Unit::TestCase
    
  must 'be Integer instance' do
    assert 1.0.is_float?
  end
  
end
