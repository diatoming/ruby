#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# objc.rb
# date: 2014.04.08
#++

# == Description
# Inlining Objective-C code :)
#
# == Installation
# $ sudo gem install RubyInline
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

module RCObjc

  class CCode < Object
    
    require 'inline'
    
    inline do |builder|
      
      builder.include '<Foundation/Foundation.h>'
      
      #builder.add_compile_flags '-g'
      #builder.add_compile_flags '-Wall'
      #builder.add_compile_flags '-Wextra'
      
      builder.add_compile_flags '-ObjC'
      builder.add_compile_flags '-fobjc-arc'
      builder.add_compile_flags '-framework'
      builder.add_compile_flags 'Foundation'
      
      # link-time-optimization
      # fastests, aggressive optimizations 
      # relax IEEE compliance
      builder.add_compile_flags '-flto'
      builder.add_compile_flags '-Ofast'
      builder.add_compile_flags '-ffast-math'
      
      builder.c <<-EOS
      /*
      NAME:   nslog_msg
      DESC:   log a message using NSLog
      INPUT:  a C string
      OUTPUT: void
      */
      void nslog_msg(char *msg) 
      {
        NSString *str = [NSString stringWithUTF8String:msg];
        
        NSLog(@"%@", [str capitalizedString]);
      }
      EOS
    end

  end

end


def main args
  ccode = RCObjc::CCode.new
  ccode.nslog_msg "This is a test!"
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

