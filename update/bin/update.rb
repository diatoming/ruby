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
                 '/Applications/TeX/TeX Live Utility.app/Contents/MacOS/TeX Live Utility'
               ]

tools = [
          'brew update',
          'brew upgrade',
          'brew cleanup'
        ]

apps.each { |app| System.launch_app app }
special_apps.each { |app| System.launch_special_app app }
tools.each { |tool| System.launch_tool tool }

p 'don\'t forget iTunes apps...'
p 'don\'t forget gems and gems packages...'
