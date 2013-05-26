#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# color.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# color on terminal!
#
# == Usage
# color.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'term/ansicolor'

class String
  include Term::ANSIColor
end

#print "Usage as String Mixins:".red.bold, "\n"
#print "clear".clear, "reset".reset, "bold".bold, "dark".dark,
#  "underscore".underscore, "blink".blink, "negative".negative,
#  "concealed".concealed, "|\n",
#  "black".black, "red".red, "green".green, "yellow".yellow,
#  "blue".blue, "magenta".magenta, "cyan".cyan, "white".white, "|\n",
#  "on_black".on_black, "on_red".on_red, "on_green".on_green,
#  "on_yellow".on_yellow, "on_blue".on_blue, "on_magenta".on_magenta,
#  "on_cyan".on_cyan, "on_white".on_white, "|\n\n"

def std_err_msg msg
  puts "Error: ".red.bold << msg.red
end

std_err_msg 'this is a test'
