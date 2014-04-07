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
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


class CCode < Object
  
  require 'inline'
  
  inline do |builder|
    
    builder.include '<math.h>'
    
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
    INPUT:  double whose factorial is to be calculated
    OUTPUT: factorial of input
    *
    NOTES:
    uses C-std tgamma function to calculate factorials. 
    For more info and usage,
    $ man gamma
    */
    double fact(double n) 
    {
        return tgamma(n + 1.0);
    }
    EOS
  end

end


def main args
  c_func = CCode.new
  p c_func.fact 10
  p c_func.fact 21
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

