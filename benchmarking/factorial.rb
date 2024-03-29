#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorial.rb
# date: 2013.06.25
#++

# == Description
# benchmarks for different implementations of 'factorial'
#
# == Source
# http://rosettacode.org/wiki/Factorial#Ruby
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# Recursive
def factorial_recursive(n)
  n.zero? ? 1 : n * factorial_recursive(n - 1)
end
 
# Tail-recursive
def factorial_tail_recursive(n, prod = 1)
  n.zero? ? prod : factorial_tail_recursive(n - 1, prod * n)
end
 
# Iterative with Range#each
def factorial_iterative(n)
  (2 .. n - 1).each {|i| n *= i}
  n
end
 
# Iterative with Range#inject
def factorial_inject(n)
  (1..n).inject {|prod, i| prod * i}
end
 
# Iterative with Range#reduce, requires Ruby 1.8.7
def factorial_reduce(n)
  (1..n).reduce(:*)
end

# Memoization
$kfact = {0 => 1, 1 => 1}
def factorial_memoization(n)
  return $kfact[n] if $kfact.include? n
  res = factorial_memoization(n - 1) * n
  $kfact[n] = res
  return res
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
