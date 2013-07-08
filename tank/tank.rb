#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tank.rb
# date: 2013.07.08
#++

# == Description
# tank model
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

class Tank < Object
  
  require 'pipe'
  
  attr_accessor :availableVolume
  attr_accessor :occupiedVolume
  attr_accessor :totalVolume
  
  attr_accessor :pipe
  
  def initialize totalVolume, pipe
    @totalVolume = totalVolume
    @pipe = Pipe.new pipe.diameter
  end
  
  def fillWithVolume volume
    @occupiedVolume = volume
    @availableVolume = @totalVolume - volume
  end
  
  def liquidInPipeVelocity velocity
    @pipe.liquidVelocity = velocity
  end
  
  def fillVolumeDuringTime time
    @pipe.volumetricFlowRate
    self.fillWithVolume(@pipe.transportedVolumeDuringTime time)
  end
  
end


if $0 == __FILE__
  begin
    
    require 'pipe'
    
    diameter = 100.0 / 1000.0 # 110 mm in m
    liquidVelocity = 1.0      # m/s
    time = 60.0               #s
    
    volume = 10.0           # 10.0 m^3
    tank = Tank.new volume, (Pipe.new diameter)
    tank.liquidInPipeVelocity liquidVelocity
    
    p tank.fillVolumeDuringTime time
    p tank.occupiedVolume
    
    #tank.pipe.liquidVelocity = liquidVelocity
    #tank.pipe.volumetricFlowRate
    #tank.pipe.transportedVolumeDuringTime time
    
    #tank.fillWithVolume 4.0
    #p tank.totalVolume
    #p tank.availableVolume
    #p tank.occupiedVolume
    
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

