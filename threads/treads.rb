#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# treads.rb
# current v.: 0.0.1
# date: 2013.05.27
#++

# == Description
# example on using threads
#
# == Usage
# treads.rb
#
# == Source
# http://www.tutorialspoint.com/ruby/ruby_multithreading.htm
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

def func1
   i = 0
   while i <= 2
      puts "func1 at: #{Time.now}"
      sleep 2
      i = i + 1
   end
end

def func2
   j = 0
   while j <= 2
      puts "func2 at: #{Time.now}"
      sleep 1
      j = j + 1
   end
end

puts "Started At #{Time.now}"
threads = [] << Thread.new do func1() end
threads = [] << Thread.new do func2() end

threads.each do |thread| thread.join end
puts "End at #{Time.now}"
