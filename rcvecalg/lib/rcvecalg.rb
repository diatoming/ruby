#--
# lib_rcvecalg.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# This class encapsulates the functionality related to
# extends Array class to model vector algebra
#
# == Description
# elementary vector algebra
#
# == Example
# 
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

class Array < Object
  
  NonNumericValueError    = Class.new StandardError
  NonSameSizeVectorsError = Class.new StandardError
  NonVectorValueError     = Class.new StandardError
  
  def validate x
    raise NonVectorValueError unless x.is_a? Array
    raise NonSameSizeVectorsError unless self.length == x.length
  end
  
  # vector addition
  def add x
    validate x
    tmp  = []
    (self.zip x).each do |i| tmp << (i.inject :+) end
    tmp
  end
  
  # cos angle between two vectors
  def cos_theta x
    validate x
    u_y = self.mk_unit
    u_x = x.mk_unit
    u_y.dot u_x
  end
  
  # dot product
  def dot x
    validate x
    tmp  = []
    (self.zip x).each do |i| tmp << (i.inject :*) end
    tmp.inject :+
  end
  
  # unit vector
  def mk_unit
    f = 1.0 / self.mod
    self.scale f
  end
  
  # negation
  def neg
    n = -1
    self.scale n
  end
  
  # Modulus or Euclidean norm
  def mod
    Math::sqrt(self.dot self)
  end
  
  def parallel? x
    validate x
    ((self.cos_theta x) == 1.0) ? true : false
  end
  
  def perpendicular? x
    validate x
    ((self.cos_theta x) == 0.0) ? true : false
  end
  
  # multiplication by scalar
  def scale n
    raise NonNumericValueError unless n.is_a? Numeric
    self.map do |i| i * n end
  end
  
  # angle between two vectors in rad
  def theta x
    validate x
    Math::acos(self.cos_theta x)
  end
  
  # angle between two vectors in deg
  def theta_deg x
    validate x
    theta = self.theta x
    theta.to_f * 180.0 / Math::PI
  end
end
