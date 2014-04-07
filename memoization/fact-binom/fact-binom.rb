#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fact-binom.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# factorials and binomial coefficients
#
# == Usage
# fact-binom.rb
# 
# == Installation
# $ sudo gem install Memoize
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Maths < Object
  
  def Maths.fact n
    (2..n).inject :*
  end
  
  def Maths.n_choose_k n, k
    # binomial coefficient: n C k: n choose k
    a = self.fact n       # a = n!
    b = self.fact k       # b = k!
    c = self.fact(n - k)  # c = (n - k)!
    a / (b * c)
  end
  
  require 'Memoize'
  Memoize.register self, 'fact'
  Memoize.register self, 'n_choose_k'
end


def main args
  
  p Maths::fact 10
  p Maths::n_choose_k 20, 10
  
  exit
end

if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

