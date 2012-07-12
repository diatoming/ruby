#!/usr/local/bin/ruby -w
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/rcvecalg'

class TestArray < Test::Unit::TestCase

  def setup
    @a = (1..3).to_a
    @b = (3..5).to_a
    
    @ua = [1, 0]
    @ub = [0, 1]
  end

  must 'return known module value' do 
    known_mod = 3.7416573867739413
    assert_equal known_mod, @a.mod
  end
  
  must 'return known dot product value' do
    known_dot_prod = 26
    assert_equal known_dot_prod, (@a.dot @b)
  end
  
  must 'return known vector addition value' do
    known_add = [4, 6, 8]
    assert_equal known_add, (@a.add @b)
  end
  
  must 'return known scale by factor value' do
    known_scale = [2, 4, 6]
    n = 2
    assert_equal known_scale, (@a.scale n)
  end
  
  must 'return known negation value' do
    known_neg = [-1, -2, -3]
    assert_equal known_neg, (@a.neg)
  end
  
  must 'return known unit vector' do
    known_uvector = [0.2672612419124244, 0.5345224838248488, 
      0.8017837257372732]
    assert_equal known_uvector, @a.mk_unit
  end
  
  must 'return known angle between vectors' do
    known_theta = 1.5707963267948966
    assert_equal known_theta, (@ua.theta @ub)
  end
  
  must 'return known angle between vectors in deg' do
    known_theta = 90.0
    assert_equal known_theta, (@ua.theta_deg @ub)
  end
  
  must 'return true when two vectors are perpendicular' do
    assert @ua.perpendicular? @ub
  end
  
  must 'return true when two vectors are parallel' do
    d = [2, 0]
    assert @ua.parallel? d
  end

end
