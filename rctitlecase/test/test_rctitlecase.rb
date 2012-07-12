#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/rctitlecase'

class TestString < Test::Unit::TestCase

  def setup
    @str = 'this is a test string!'
  end

  must 'return known output for known input' do
    assert_equal 'This Is A Test String!', @str.titlecase
  end
  
  must 'not replace original string' do
    s_before = @str
    s_during = @str.titlecase
    s_after  = @str 
    assert_equal s_before, s_after
  end
  
  must 'replace original string' do
    assert_not_equal @str, @str.titlecase
    assert_equal 'This Is A Test String!', @str.titlecase
  end

end