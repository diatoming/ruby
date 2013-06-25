#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorial.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# factorial numbers
#
# == Usage
# factorial.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# global hash: to hold known factorials
$kfact = {0 => 1, 1 => 1}

class Fixnum
  
  def _!
    return $kfact[self] if $kfact.include? self
    res = (self - 1)._! * self
    $kfact[self] = res
    return res
  end
  
end
