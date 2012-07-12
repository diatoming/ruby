#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

#--
# rcmaintenance.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# wrapper around (mac) cleaner apps
#
# == Description
# wrapper around (mac) cleaner apps
#
# == Usage
# ruby rcmaintenance.rb
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')

require 'lib_rcsys'

apps = [
  'Dr.Web Light.app', 'ClamXav.app', 'CleanMyMac.app', 
  'MacCleanse.app', 'CCleaner.app', 'iBoostUp.app', 
  'Ds Store Remover.app'
  ]

apps.each do |app| RCSys.launch_app app end
p 'done...'
