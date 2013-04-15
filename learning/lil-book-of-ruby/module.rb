#!/usr/local/bin/ruby -w

# add modules from another dir, include the dir in the $: array!
# then use require to load them
# require returns true for successfull load and false otherwise
$: << "./"
# require 'module.rb'
# p (require 'module.rb')

# module are like namespaces/classes
module Greeter  
  # constants
  GOODMOOD = "happy" 
  BADMOOD = "grumpy"
  # module 'instance' method
  def greet
    return "I'm #{GOODMOOD}. How are you?"
  end
  # module 'class' method, like class methods
  def Greeter.greet
    return "I'm #{BADMOOD}. How are you?"
  end 
end


# to access constants, use ::
p 'module constants'
p Greeter::GOODMOOD

# to access "instance methods"
p 'module instance methods'
p Greeter.greet

# to access 'class methods' include the module in the namespace!
# including a module in the namespace is called a 'mixin'
p 'class methods'
include Greeter
p greet


# class that uses the module
class GreeterClass
  include Greeter
  def say_hi
    puts greet
  end  
  def say_hi_again
    puts Greeter.greet
  end 
end

p 'class and module mixin'
greeter_object = GreeterClass.new
greeter_object.say_hi
greeter_object.say_hi_again
