#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# update.rb
# date: 2013.06.25
#++

# == Description
# launches apps that update the system
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
  'MacUpdate Desktop.app',
  'GitHub.app', 
  'Dropbox.app', 
  'OneDrive.app',
  'Google Drive.app'
  ]
  
special_apps = [
  '/Applications/TeX/TeX Live Utility.app/Contents/MacOS/TeX Live Utility',
  ]
  
tools = [
  'brew update', 
  'brew upgrade', 
  'brew cleanup',
  ]

apps.each do |app| System.launch_app app end
special_apps.each do |app| System.launch_special_app app end
tools.each do |tool| System.launch_tool tool end

p 'don\'t forget gems and gems packages...'
