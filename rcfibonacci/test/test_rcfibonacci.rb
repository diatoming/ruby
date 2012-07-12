#!/usr/local/bin/ruby -w
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/lib_rcfibonacci'

class TestFibonacci < Test::Unit::TestCase

  def setup
    @test_array = []
  end

  must 'raise exception with float argument' do 
    assert_raise ArgumentError do @test_array.fib_up_to 1.0 end
  end
  
  must 'raise exception with string argument' do
    str = ['1', '1.0', 'test']
    str.each do |s| 
      assert_raise ArgumentError do @test_array.fib_up_to s end
    end
  end
  
  must 'raise exception with bad input' do
    bad = [-1, 0]
    bad.each do |i| 
      assert_raise RangeError do @test_array.fib_up_to i end
    end
  end
  
  must 'producte known output for known input' do
    n = 100
    expected = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    actual   = @test_array.fib_up_to n
    assert_equal expected, actual
  end

end

