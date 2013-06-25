#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tau.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# Tau number :)
#
# == Usage
# tau.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
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
