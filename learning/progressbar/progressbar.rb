#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# progressbar.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# example of progress bar
#
# == Usage
# progressbar.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


require 'ruby-progressbar'


pb = ProgressBar.create(:title => "Download", :starting_at => 0, 
  :total => 100)

# #increment increases the bar by 1
100.times do pb.increment end

# #reset resets bar to :starting_at
pb.reset

# #progress += increases the bar by a defined amount
10.times do pb.progress += 10 end

pb.reset

# formatted progress-bar with time
pb = ProgressBar.create(:format => '%a %B %p%% %t')
10.times do pb.progress += 10 end

