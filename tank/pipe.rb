#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# pipe.rb
# date: 2013.07.08
#++

# == Description
# pipe transporting liquid model
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class Pipe < Object
  
  attr_accessor :area  
  attr_accessor :diameter
  attr_accessor :transportedVolume
  attr_accessor :liquidVelocity
  attr_accessor :volumetricFlowRate
  
  def initialize diameter
    @diameter = diameter
    @area = Math::PI * @diameter * @diameter / 4.0
  end
  
  def volumetricFlowRate
    @volumetricFlowRate = @area * @liquidVelocity
  end
  
  def transportedVolumeDuringTime time
    @transportedVolume = @volumetricFlowRate * time
  end
  
end

if $0 == __FILE__
  begin
    diameter = 100.0 / 1000.0 # 110 mm in m
    liquidVelocity = 1.0      # m/s
    time = 60.0               #s
    
    pipe = Pipe.new diameter
    pipe.liquidVelocity = liquidVelocity
    p pipe.volumetricFlowRate
    p pipe.transportedVolumeDuringTime time
    
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
