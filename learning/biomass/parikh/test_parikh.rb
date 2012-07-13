#!/usr/local/bin/ruby -w
# Have faith in the way things are.
#
# test_parikh.rb
# test suite for parikh
# Copyright 2012 RimbaudCode
# License: GPLv3+

require 'test/unit'
require './parikh.rb'

class TestParikh < Test::Unit::TestCase
  
  def test_initialize
    pa = Parikh.new 0.05, 0.75
    assert_instance_of(Parikh, pa)
    assert_equal(0.05, pa.fc)
    assert_equal(0.75, pa.vm)
    # fc out of range
    assert_raises(RangeError) {Parikh.new 0.0, 0.60}
    # vm out of range
    assert_raises(RangeError) {Parikh.new 0.10, 0.50}
    # fc and vm out of range
    assert_raises(RangeError) {Parikh.new 0.046, 0.571}
    # fc and vm out of range
    assert_raises(RangeError) {Parikh.new 0.383, 0.907}
  end
  def test_carbon
    pa = Parikh.new 0.05, 0.75
    assert_equal(0.3731, pa.carbon)
    pb = Parikh.new 0.10, 0.60
    assert_raises(RangeError) {pb.carbon}
  end
  def test_hydrogen
    pa = Parikh.new 0.05, 0.75
    assert_equal(0.0491, pa.hydrogen)
    pb = Parikh.new 0.10, 0.60
    assert_raises(RangeError) {pb.hydrogen}
  end
  def test_oxygen
    pa = Parikh.new 0.05, 0.75
    assert_equal(0.3722, pa.oxygen)
    pb = Parikh.new 0.07, 0.60
    assert_raises(RangeError) {pb.oxygen}
  end
  def test_elements
    pa = Parikh.new 0.05, 0.75
    assert_equal({'C' => 0.3731, 'H' => 0.0491, 'O' => 0.3722}, 
                  pa.elements)
  end
end
