#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/lib_rcfactorial'

class TestFactorial < Test::Unit::TestCase
  
  must 'respond to its methods' do
    methods = ['_!']
    methods.each do |m| 
      assert_respond_to 1, m
    end
  end

  must 'produce known output for known input' do
     # must produce known output for known input
      known_values = {
        0  => 1,
        1  => 1,
        10 => 3628800,
        20 => 2432902008176640000
      }
      known_values.each do |k, v|
        assert_equal known_values[k], k._!
      end
  end
  
  must 'fail with negative integer values as input' do
    bad_input = [-2, -1]
    assert_raise NegativeIntegerValueError do 
      bad_input.each do |v| v._! end 
    end
  end

end
