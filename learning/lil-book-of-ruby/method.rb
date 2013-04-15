#!/usr/bin/env ruby -wKU

def say_something txt
  p "#{txt}"
end

txt = 'this is a test!'
say_something txt


def say_hi first_name, last_name
  p "Hello, #{first_name} #{last_name}!"
end

name, last = "Test", "Name"
say_hi name, last
