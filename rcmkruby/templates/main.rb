#!/usr/local/bin/macruby
# Have faith in the way things are.

# Require external libs

# Require local libs
require '#proj_name/exceptions'
require '#proj_name/version'

#--
# #proj_name.rb
# init. rel.:  #date
# current v.:  #version
#++

# == Description
# This tool
#
# == Usage
# ruby #proj_name.rb [opts]
#
# == Example
# 
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

module #ProjName
  
  # code here!
  
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '../lib')
    
    # require external libs
    # require local libs
    require ''
    
    
    
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
