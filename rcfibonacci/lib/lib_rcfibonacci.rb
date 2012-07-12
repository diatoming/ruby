#--
# lib_rcfibonacci.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# extends Array to calculate Fibonacci numbers
#
# == Description
# return a list of Fibonacci numbers given up to a given max int
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

class Array
  def fib_up_to max
    raise RangeError unless max > 0
    n1, n2 = 1, 1
    while n1 <= max
      self << n1
      n1, n2 = n2, n1 + n2
    end
      self
  end
end

