#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# pendulum.rb
# date: 2014.07.17
#++

# == Description
# Models a mathematical pendulum
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

class Pendulum < Object
  
  require 'constants'
  
  def initialize lenght
    @lenght = lenght
  end
  
  def period
    2.0 * Math::PI * Math::sqrt(@lenght / Constants::GRAVITY)
  end
  
end


def main args
  length = 1.0
  pendulum = Pendulum.new length
  p pendulum.period
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

