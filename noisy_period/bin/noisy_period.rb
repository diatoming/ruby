#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# noisy_period.rb
# date: 2014.07.17
#++

# == Description
# Add noise to the math pendulum period and perform experiments with it
#
# == Dependencies
# $ sudo install gem 'descriptive_statistics'
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


def main args
  
  $LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))
  
  require 'descriptive_statistics'
  require 'pp'
  
  require 'noisegen'
  require 'pendulum'

  experiments = 1_000
  lo_noise    = -0.01
  hi_noise    = 0.01
  length      = 1.0
  swings      = []

  noise_gen = NoiseGen.new lo_noise, hi_noise
  pendulum  = Pendulum.new length

  experiments.times do swings << pendulum.period + noise_gen.noise end

  pp swings.descriptive_statistics
  
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

