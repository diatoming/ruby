#--
# lib_rctitlecase.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# This module encapsulates the functionality related to
# extends String case to map strings in title case
#
# == Description
# uppercase first letters of words
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

class String
  #  Dave Thomas and Andrew Hunt. Programming Ruby
  def titlecase
    gsub(/\b\w/) {|first| first.upcase }
  end
  def titlecase!
    gsub!(/\b\w/) {|first| first.upcase }
  end
end
