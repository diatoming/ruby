#!/usr/bin/env ruby -wKU

class Dog < Object
  
  attr_reader :name
  
  def initialize name, breed, age
    @name = name.capitalize
    @breed = breed
    @age = age
  end
  
  def bark
    'woof!'
  end
  
  def sleep
    'zzz...'
  end
  
end

rocky = Dog.new 'Rocky', 'German Shepherd', 4

p rocky.name
p rocky.bark
p rocky.sleep

