#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fact.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# factorials by inlining C-code
#
# == Usage
# fact.rb
#
# == Installation
# $ sudo gem install RubyInline
#
# == Compiled code
# Compiled code is stored in '~/.ruby_inline'
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class CCode < Object
  
  require 'inline'
  
  inline do |builder|
    
    builder.include '<assert.h>'
    builder.include '<iso646.h>'
    builder.include '<limits.h>'
    
    #builder.add_compile_flags '-g'
    #builder.add_compile_flags '-Wall'
    #builder.add_compile_flags '-Wextra'

    # link-time-optimization
    # fastests, aggressive optimizations 
    # relax IEEE compliance
    builder.add_compile_flags '-flto'
    builder.add_compile_flags '-Ofast'
    builder.add_compile_flags '-ffast-math'
    
    builder.c <<-EOS
    /*
    NAME:   fact
    INPUT:  integer whose factorial is to be calculated
    OUTPUT: factorial of input
    *
    NOTES:
    by trial and error :( the max input is n = 20, which produces a 
    value of fact(20) = 2432902008176640000. If n = 21 is used, then 
    the code produces incorrect values for fact(21) or more.
    */
    unsigned long fact(unsigned long n) 
    {
        unsigned long _MAX_INPUT  = 20;
        unsigned long _MAX_OUTPUT = 2432902008176640000;
        
        assert(sizeof(unsigned long) == sizeof(n));
        assert(n >= 0 and n <= _MAX_INPUT);
        
        unsigned long i   = n;
        unsigned long res = 1;
        
        while (i >= 2)
          res *= i--; 
        
        assert(res <= _MAX_OUTPUT);
        
        return res;
    }
    EOS
  end

end


def main args
  c_func = CCode.new
  p c_func.fact 20
  
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
