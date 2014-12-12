#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# inline.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# random numbers by inlining C-code
#
# == Usage
# random.rb
#
# == Installation
# $ sudo gem install RubyInline
#
# == Example
# c_func = CCode.new
# p c_func.rand_unit
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class CCode < Object
  
  require 'inline'
  
  FileUtils.rm_rf File.expand_path '~/.ruby_inline' # nm old code
  
  @compileCode = :debug
      
  inline do |builder|
    
    builder.include '<limits.h>'
    
    case @compileCode
    when :debug then
      p 'debug code...'
      builder.add_compile_flags '-g'
      builder.add_compile_flags '-Wall'
      #builder.add_compile_flags '-Wextra'
      builder.add_compile_flags '-Werror'
    when :release then
      #p 'release code...'
      builder.add_compile_flags '-flto'       # link-time-optimization
      builder.add_compile_flags '-Ofast'      # aggressive optimizations
      builder.add_compile_flags '-ffast-math' # relax IEEE compliance
    when nil then
      p 'no compiler flag...'
    end
    
    builder.c <<-EOS
    /*
    NAME:   rand_unit
    INPUT:  none
    OUTPUT: 'random' decimal number in the interval [0,1[
    *
    NOTES:
    implementation of the function arc4random_uniform().
    for more info, $ man arc4random.
    */
    double rand_unit()
    {
      return (double) arc4random_uniform(UINT_MAX)/(UINT_MAX);
    }
    EOS
  end
end


def main args
  c_func = CCode.new

  range = (0..1_000)
  array = []
  range.each do |num| array << c_func.rand_unit end
  puts array
  
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
