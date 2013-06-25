#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# update.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# launches apps that update the system
#
# == Usage
# update.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'update'

apps = [
  'App Store.app',
  'AppFresh.app',
  'GitHub.app', 
  'Xmarks for Safari.app',
  'Dropbox.app', 
  'SkyDrive.app', 
  #'Copy.app',
  'doo.app',
  'JewelryBox.app',
  ]
  
special_apps = [
  '/Applications/TeX/TeX Live Utility.app/Contents/MacOS/TeX Live Utility',
  ]
  
tools = ['brew update', 'brew upgrade', 'cabal update']

apps.each do |app| RCSys.launch_app app end
special_apps.each do |app| RCSys.launch_special_app app end
tools.each do |tool| RCSys.launch_tool tool end

p 'don\'t forget to update gems and gems packages'
p 'also macruby...'
p 'done...'