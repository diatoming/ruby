#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# countdown.rb
# date: 2014.01.16
#++

# == Description
# example of inline cpp code
#
# taken from
# https://github.com/seattlerb/rubyinline
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


require 'inline'

class CppCode
 inline(:C) do |builder|
   builder.include '<iostream>'
   builder.add_compile_flags '-x c++', '-lstdc++'
   builder.c '
     void hello(int i) {
       while (i-- > 0) {
         std::cout << "hello" << std::endl;
       }
     }'
 end
end


def main args
  
  CppCode.new.hello 3
  
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
