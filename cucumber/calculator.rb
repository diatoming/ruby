#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# calculator.rb
# date: 2013.08.19
#++

# == Description
# cucumber example
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Calculator < Object
  
  def push n
    @args || = []
    @args << n
  end
  
end
