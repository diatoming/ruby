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

$kfact = {0 => 1, 1 => 1}

class Fixnum
  
  def _!
    return $kfact[self] if $kfact.include? self
    res = (self - 1)._! * self
    $kfact[self] = res
    return res
  end
  
end

class CCode < Object
  
  require 'inline'
  
  inline do |builder|
    
    builder.include '<assert.h>'
    builder.include '<iso646.h>'
    
    builder.add_compile_flags '-O3'
    
    builder.c <<-EOS
    long factorial(int n)
    {
      assert(sizeof(int) == sizeof(n));
      assert(n >= 0 and n <= 20);
      long result = 1;

      for (int c = 1; c <= n; c++)
        result = result * c;

      return result;
    }
    EOS
  end
end
