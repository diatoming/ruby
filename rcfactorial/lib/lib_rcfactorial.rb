#--
# lib_rc.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# Add functionality to Integer to calculate factorials
#
# == Description
# return the factorial of a given integer
#
# == Example
# 10._!                   # --> 3628800
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

class Integer
  
  NegativeIntegerValueError = Class.new StandardError
  $kfact = {0 => 1, 1 => 1}

  def _!
    raise NegativeIntegerValueError if self < 0
    test = $kfact.include? self
    case
      when test then res = $kfact[self]
      when !test then res = (self - 1)._! * self ; $kfact[self] = res
    end
    res
  end
  
end
