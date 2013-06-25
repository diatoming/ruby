#--
# lib_rcbinomial.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

=begin rdoc
return the binomial coefficient given n and k (n choose k)

== Examples:
 100.choose 10          # --> ...
 
--
Copyright (c) 2012 RimbaudCode
Licensed under GPLv3+. No warranty provided.
=end

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'factorial'

class Integer
  
  KValueBiggerThanNError = Class.new StandardError
  
  # n choose k (binomial coefficient): n == self
  def choose k
    raise KValueBiggerThanNError if k > self
    _! / ((self - k)._! * k._!)
  end
  
  # convert factorials into scientific notation
  def to_sci
    ("%E" % self).to_f
  end

end
