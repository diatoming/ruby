#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# car.rb
# v.: 0.0.1
#++

# == Description
# simple model of a car
#
# the Car class models the total distance that a car travels in different 
# directions
#
# == Usage
# car.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

# a class definition gives the blue print of the model
# it holds the methods that any particular instance can do
class Car < Object
  
  # instance vars (ivars) define the state of the model
  # they're particular of a given instance of the class
  # in Ruby:
  #   ivars are called 'attributes'
  #   they are regularly initialize within the initialize method;
  # in other programming languages, object initialization is called
  # 'object construction' and the 'initialize' method equivalent is then 
  # called 'constructor'
  #   if no initial state is provided, all ivars are set to a default
  # value
  def initialize
    @odometer = 0.0
  end
  
  # actions give an instance functionality
  # in Ruby, they are called 'methods'
  def drive_north distance
    @odometer += distance
  end
    
  # in Ruby, aliases provide a convenient way to avoid code repetition
  alias :drive_south :drive_north
  alias :drive_east  :drive_north
  alias :drive_west  :drive_north
  
  # in Ruby, there are two ways of accesing instance vars (an instance
  # state): 
  # 1. via the declarations of attributes
  #   attr_reader :attr_name      # read-only the value of an ivar
  #   attr_writer :attr_name      # write-only the value of an ivar
  #   attr_accessor :attr_name    # read and write the value of an ivar
  # 2. via a convinient method, such as
  def read_odometer
    @odometer
  end
  # even though it's possible (and sometimes convinient) to use accessors
  # it's better practice not to; to be consistent with Encapsulation
  # (an OOP mouthful)
  
  # the Encapsulation rule has an exception, of course: Protected
  # methods can be invoked only by objects of the defining class and 
  # its subclasses. Access is kept within the family.
  protected
  attr_accessor :odometer
  
  # Private methods cannot be called with an explicit receiver — the 
  # receiver is always self. This means that private methods can be
  # called only in the context of the current object; you can't invoke 
  # another object's private methods.
  #private
  #def show_off
  #  "I'm a brand new car!"
  #end
  
end

# check out an object (instance of the Car class):
volvo = Car.new 
# print its initial state
p volvo.read_odometer

# get info about the object
p volvo.inspect
p volvo.class
p volvo.class.ancestors
p volvo.methods

# do something with the object; thus, change its state
volvo.drive_north 10
volvo.drive_south 20
# retrieve its new state
p volvo.read_odometer

# do something else with the object
volvo.drive_north 20.1
volvo.drive_east 40.5
volvo.drive_west 55.0
volvo.drive_south 100.0
# let's see its state
p volvo.read_odometer


# inheritance:
# Car inherits from Object; OldCar from Car, and thus from Object
# in Ruby, only the class parent (not the whole ancesters) needs to be 
# acknowledge, this is done using the '<' sign
# OldCar has the same functionality than the Car class; however, methods
# can be added or overriden
class OldCar < Car
  
  # method override: instead of using the parent method, a child can
  # override its implementation
  # NB: remember to check the access status of the methods you want
  # to use from the class
  def initialize old_odometer_lecture
    @odometer = old_odometer_lecture
  end
  
  # let's add new functionality the OldCar class
  # this functionality is child exclusive; it will not be shared with the
  # parent class; ie, an instance of the Car class cannot respond to
  # these methods. However, a child of the OldCar class can respond to
  # them (if not overriden, of course ;)
  def show_off
    "This weekend I'm invited to a 'only-classic-cars-can-go' party ;)"
  end
  
end

# check out an instance of the OldCar class
ford_t = OldCar.new 250000
# print its state
p ford_t.read_odometer

# let's drive it a bit and check its state
ford_t.drive_north 10
ford_t.drive_west 200
p ford_t.read_odometer

# check the OldCar exclusive functionality
p ford_t.show_off
