#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# animals.rb
# current v.: 0.0.1
# date: 2013.05.27
#++

# == Description
# example of modules
#
# == Usage
# animals.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

module Animals
  
  KINGDOM = 'animal kingdom'
  
  class Animals < Object
    def initialize name
      @name = name
    end
    def sleep
      'zzz...'
    end
  end
  
  class Dog < Animals
    def bark
      'woof...'
    end
  end
  
  class Cat < Animals
    def meow
      'meow...'
    end
  end
end


def main args
  p Animals::KINGDOM

  snoop = Animals::Dog.new 'Snoopy'
  p snoop.inspect
  p snoop.bark

  kitty = Animals::Cat.new 'Kitty'
  p kitty.inspect
  p kitty.meow
  
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
