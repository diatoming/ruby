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
      
      builder.include '<Cocoa/Cocoa.h>'
      
      builder.add_compile_flags '-g'
      builder.add_compile_flags '-ObjC'
      builder.add_compile_flags '-fobjc-arc'
      builder.add_compile_flags '-framework'
      builder.add_compile_flags 'Cocoa'
        
      #builder.add_compile_flags '-O4'
      
      builder.c <<-EOS
      /*
      NAME:   nsalert
      DESC:   beep using NSBeep()
      INPUT:  void
      OUTPUT: void
      */
      void nsalert(void) 
      {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert addButtonWithTitle:@"Cancel"];
        [alert setMessageText:@"Delete the record?"];
        [alert setInformativeText:@"Deleted records cannot be restored."];
        [alert setAlertStyle:NSWarningAlertStyle];
        
        [alert runModal];
      }
      EOS
    end

  end

end


def main args
  ccode = RCObjc::CCode.new
  ccode.nsalert
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

