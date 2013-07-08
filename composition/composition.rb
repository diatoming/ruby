#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# composition.rb
# date: 2013.07.08
#++

# == Description
# composition in ruby
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Other
    def override
        puts "OTHER override"
    end
    def implicit
        puts "OTHER implicit"
    end
    def altered
        puts "OTHER altered"
    end
end

class Child
    def initialize
        @other = Other.new
    end
    def implicit
        @other.implicit
    end
    def override
        puts "CHILD override"
    end
    def altered
        puts "CHILD, BEFORE OTHER altered"
        @other.altered
        puts "CHILD, AFTER OTHER altered"
    end
end

if $0 == __FILE__
  begin
    son = Child.new
    
    son.implicit
    son.override
    son.altered
    
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
