#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/lib_rcbinomial'

class TestBinomial < Test::Unit::TestCase
  
  must 'respond to its methods' do
    methods = ['choose', 'to_sci']
    methods.each do |m| 
      assert_respond_to 1, m
    end
  end

  must 'produce known output for known input' do 
    known_input = 500, 10
    known_output = 245810588801891098700
    assert_equal known_output, (known_input[0].choose known_input[1])
  end
  
  must 'fail when k is bigger than n' do
    bad_input = 1, 2
    assert_raise(KValueBiggerThanNError) do 
      bad_input[0].choose bad_input[1] 
      end
  end
  
  must 'fail with negative integer values as input' do
    bad_input = 1, -1
    assert_raise NegativeIntegerValueError do 
      bad_input[0].choose bad_input[1]
    end
  end
  
end
