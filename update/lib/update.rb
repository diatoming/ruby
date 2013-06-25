#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# update.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# update system
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

module System

  def self.launch_app app
    p "running #{app}..."
    base = File.basename app, '.app'
    exe = "/Applications/#{app}/Contents/MacOS/#{base}".gsub(' ', '\\ ')
    `#{exe}`
    warning = "#{app} exited with status #{$?.exitstatus}"
    warn warning unless $?.success?
  end
  
  def self.launch_special_app app
    # special apps are those which are not in the /Applications folder
    # or have a different pattern than those in such location
    base = File.basename app
    exe = app.gsub(' ', '\\ ')
    p "running #{base}..."
    `#{exe}`
    warning = "#{base} exited with status #{$?.exitstatus}"
    warn warning unless $?.success?
  end
  
  def self.launch_tool tool
    p "running #{tool}..."
    `#{tool}`
    warning = "#{tool} exited with status #{$?.exitstatus}"
    warn warning unless $?.success?
  end

end
