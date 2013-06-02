#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# downloader.rb
# current v.: 0.0.1
# date: 2013.06.02
#++

# == Description
# download a url file to string
#
# == Usage
# downloader.rb
#
# == Source
# http://winn.ws/blog/2008/02/16/How-to-download-files-with-Rubys/
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class String < Object
  
  require 'net/http'
  
  def self.with_contents_of_url url
    string = String.new
    uri    = URI url
        
    Net::HTTP.start uri.host do |http| 
      response = http.get uri.path
      string << response.body
    end
    string
  end
      
  def write_to_path path
    path = File.absolute_path(File.expand_path path)
    File.open path, 'w' do |file| 
      file.write self
    end
  end
  
end

def main args
  url = 'https://en.wikipedia.org/wiki/Biomass'
  str = String.with_contents_of_url url
  str.write_to_path './biomass.html'
        
  exit
end

if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
