#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# is-num.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# test if a string contains numeric values
#
# == Usage
# is-num.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class String
  
  def is_float?
    !!Float(self) rescue false
  end
  
  def is_int?
    !!Integer(self) rescue false
  end
  
end
