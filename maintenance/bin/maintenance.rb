#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# rcmaintenance.rb
# current v.: 0.0.1
# date: 2012.06.01
#++

# == Description
# wrapper around (mac) cleaner apps
#
# == Usage
# maintenance.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

require 'maintenance'

apps = [
  'AdwareMedic.app',
  'ClamXav.app', 
  #'CleanMyMac 2.app', 
  #'MacCleanse.app', 
  'CCleaner.app', 
  'Quick Cleaner.app'
  'Ds Store Remover.app',
  'DupCleanerLite.app'
  ]

apps.each do |app| RCSys.launch_app app end

p "don't forget Onyx..."
p 'done...'
