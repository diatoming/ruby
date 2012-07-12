#!/usr/local/bin/ruby -w
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/rcisnum'

class TestString < Test::Unit::TestCase

  def setup
    
  end
  
  must '(str) respond to its methods' do
    methods = ['is_float?', 'is_int?']
    methods.each do |m| 
      assert_respond_to '1', m
    end
  end

  must '(is_float?) produce known output with numeric input' do 
    good_input = ['-1', '0', '1', '-1.0', '0.0', '1.0']
    good_input.each do |str| assert str.is_float? end
  end
  
  must '(is_float?) assert exception with string input' do
    bad_input = 'test'
    assert !bad_input.is_float?
  end
  
  must '(is_int?) produce known output with int input' do
    good_input = ['-1', '0', '1']
    good_input.each do |str| assert str.is_int? end
  end
  
  must '(is_int?) assert exception with string and float input' do
    bad_input = ['-1.0', '0.0', '1.0', 'test']
    bad_input.each do |str| assert !str.is_int? end
  end

end
