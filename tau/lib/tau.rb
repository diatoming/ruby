#--
# lib_rctau.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# This module encapsulates the functionality related to
# Maths functions
#
# == Description
# return the tau number, 2 * pi, using hi-precision arithmetics
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

module Math
  
  require 'bigdecimal'
  
  def self.tau
      # x: extended precision 
      xpi = BigDecimal.new "3.1415926535897932384626433832795028"
      xtwo = BigDecimal.new "2.0"
      xpi * xtwo
  end
  
end
