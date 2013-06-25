#!/usr/bin/env ruby -wKU
# encoding: UTF-8
# Have faith in the way things are.
require 'bigdecimal'

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/lib_rctau'

class TestMath < Test::Unit::TestCase

  def setup
    
  end

  must 'return tau number' do 
    exp_tau = "6.2831853071795864769252867665590056"
    actual_tau = Math.tau
    assert_equal(exp_tau, actual_tau.to_s('F'))
  end

end