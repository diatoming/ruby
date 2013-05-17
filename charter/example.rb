#!/usr/local/bin/ruby
# Have faith in the way things are.

# example.rb
# using Charter.app and charter_client libraries to plot graphs
#--
# Created by Paolo Bosetti on 2011-09-02.
# Copyright (c) 2011 University of Trento. All rights reserved.
#
# modified by art
# Copyright 2012 RimbaudCode
# Licensed under GPLv3+. No warranty is provided.
#
# usage:
# copy charter_client.rb in ./lib
# open Charter.app (download from App store), launch it and set state 
# to running
# (turn the switch ON)
# run this script (example.rb)
#++

$LOAD_PATH << './lib'

require 'charter_client'

# Instantiate a new Charter::Client object:
ch = Charter::Client.new(1)  # 1 is the default ID

# Clear the buffer
ch.clear

# send data (speed, velocity and acceleration based on math functions)
200.times do |x|
  # Use the 's' mode:
  # send an array like [x, y1, y2, y3]
  ch << [x/10.0, Math::sin(x/10.0), 1.1*Math::cos(x/10.0), 0.7*Math::sin(x/10.0)+rand*0.05]
end

# label axes
ch.labels %w(Time Dinamical_functions)
# label lines
ch.names %w(speed velocity acceleration)

# another example rigth away
#sleep 5

# plot random numbers
#200.times do |i|
#  # alternatively, use the 'm' mode:
#  # send an array like [x1, y1], [x2, y2]
#  ch << [ [i/10.0, rand], [i/10.0+rand*0.01, rand] ]
#end

# close the connection, forcing Charter to stop updating the charts:
ch.close
