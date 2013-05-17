#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# sine.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# plot of the sine function using gnuplot
#
# == Usage
# sine.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

ENV['RB_GNUPLOT'] = `which gnuplot`.chomp
require 'gnuplot'

LATEX_OUTPUT_PATH = File.basename(__FILE__, 'rb') << 'tex'

# plot graph to latex file
Gnuplot.open do |gp|
  Gnuplot::Plot.new gp do |plot|
    
    # A4: 21.01 x 29.71 cm
    # give a little room for margins
    plot.terminal 'latex size 21.71cm, 13.01cm'
    plot.output "#{LATEX_OUTPUT_PATH}"
    # to use latex math!
    plot.format 'xy "$%g$"'
    plot.key 'bottom right'
    #plot.grid
  
    plot.title  "Array Plot Example"
    plot.ylabel "$x$"
    plot.xlabel "$x^2$"
    
    x = (0..50).collect do |v| v.to_f end
    y = x.collect do |v| v ** 2 end

    plot.data << Gnuplot::DataSet.new([x, y]) do |ds|
      ds.with = "linespoints"
      ds.notitle
    end
  end
end
