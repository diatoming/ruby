#!/usr/local/bin/ruby -w
# Have faith in the way things are.
#
# test_rcparikh.rb
# testing rcparikh.rb
# Copyright 2012 RimbaudCode
# License: GPLv3+

require 'test/unit'
require '../lib/rcparikh'

class TestParikh < Test::Unit::TestCase  
  def test_init
    par = Parikh.new 0.1, 0.6

    assert_raise ArgumentError do Parikh.new end
    assert_raise ArgumentError do Parikh.new 1.0 end
    assert_raise ArgumentError do Parikh.new 1.0, 2.0, 3.0 end
    assert_nothing_raised ArgumentError do Parikh.new 0.1, 0.6 end
    
    assert_raise FCNonFloatError do Parikh.new 1, 2.0 end
    assert_raise FCNonFloatError do Parikh.new '1.0', 2.0 end
    assert_raise VMNonFloatError do Parikh.new 1.0, 2 end
    assert_raise VMNonFloatError do Parikh.new 1.0, '2.0' end
    assert_nothing_raised FCNonFloatError do par end
    assert_nothing_raised VMNonFloatError do par end
    
    assert_raise FCRangeError do Parikh.new 0.046, 0.572 end
    assert_raise FCRangeError do Parikh.new 0.571, 0.906 end
    assert_raise VMRangeError do Parikh.new 0.047, 0.385 end
    assert_raise VMRangeError do Parikh.new 0.384, 0.907 end
  
    assert_nothing_raised RangeError do Parikh.new 0.047, 0.572 end
    assert_nothing_raised RangeError do Parikh.new 0.384, 0.906 end
    
    assert_not_nil par
    assert_instance_of Parikh, par
    assert_kind_of Parikh, par

    par2 = Parikh.new 0.1, 0.6
    assert_not_same par, par2
  end
  def test_carbon
    par = Parikh.new 0.1, 0.6
    assert_respond_to par, 'carbon'
    assert_raise CRangeError do par.carbon end

    par = Parikh.new 0.1, 0.75
    assert_in_delta 0.40495, par.carbon, 1.0e-12
  end
  def test_hydrogen
    par = Parikh.new 0.1, 0.6
    assert_respond_to par, 'hydrogen'
    assert_raise HRangeError do par.hydrogen end

    par = Parikh.new 0.1, 0.75
    assert_in_delta 0.0517, par.hydrogen, 1.0e-12
  end
  def test_oxygen
    par = Parikh.new 0.1, 0.6
    assert_respond_to par, 'oxygen'
    #assert_raise ORangeError do par.oxygen end

    par = Parikh.new 0.1, 0.75
    assert_in_delta 0.3874, par.oxygen, 1.0e-12
  end
  def test_data
    par = Parikh.new 0.1, 0.75
    assert_respond_to par, 'data'
    assert_not_nil par.data
    
    exp = '<Parikh> fc: 0.100 vm: 0.750'
    assert_equal exp, par.data
  end
  def test_results
    par = Parikh.new 0.1, 0.75
    assert_respond_to par, 'results'
    assert_not_nil par.results
    
    exp = 'C: 0.405 H: 0.0517 O: 0.387'
    assert_equal exp, par.results
  end
  def test_to_s
    par = Parikh.new 0.1, 0.75
    assert_respond_to par, 'to_s'
    assert_not_nil par.to_s
    
    exp = '<Parikh> fc: 0.100 vm: 0.750 C: 0.405 H: 0.0517 O: 0.387'
    assert_equal exp, par.to_s
  end
  def test_uncertainties
    par = Parikh.new 0.1, 0.75
    assert_respond_to par, 'uncertainties'
    assert_not_nil par.uncertainties
    
    exp = {'C:'=>[0.37285, 0.43705000000000005],
     'H:'=>[0.003799999999999998, 0.0996],
     'O:'=>[0.35339999999999994, 0.4214]}
    assert_equal exp, par.uncertainties
  end
end

