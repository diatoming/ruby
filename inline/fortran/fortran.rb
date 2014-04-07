#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fortran.rb
# date: 2014.04.07
#++

# == Description
# print integer by inlining Fortran-code
#
# == Usage
# fact.rb
#
# == Requirements
# + RubyInline
# + g95
#
# == Installation
# $ sudo gem install RubyInline
# $ sudo gem install InlineFortran
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

class FortranCode < Object
  
  require 'inline'
  
  inline :Fortran do |builder|
    
    builder.subroutine('print_integer', ["void", "int"], <<-END)
    
      subroutine print_integer( integer )
        integer, intent(in) :: integer
        print *, 'integer: ', integer
        end
      END
      end
      
end

def main args
  for_func = FortranCode.new
  for_func.print_integer
  
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

