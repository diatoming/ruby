#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# yahooweather.rb
# current v.: 0.0.1
# date: 2013.06.06
#++

# == Description
# A Ruby wrapper for the Yahoo! Weather XML RSS feed
# the lib uses Yahoo!s Where on Earth IDentifier, WOEID, a unique 32 bit 
# reference identifier assigned by Yahoo! to identify any feature on Earth.
#
# == Usage
# yahooweather.rb [WOEID]
#
# == Source
# https://github.com/stewart/weather-api
#
# == Personal note:
# at least the API and the example code look very similar to the older
# https://github.com/shaper/yahoo-weather
#
# == Example
# yahooweather 549064 # WOEID for Leoben, AT
#
# == Installation
# gem install weather-api
# 
# == Author
# Andrew Stewart
#
# == Copyright
# Copyright (c) 2012 Andrew Stewart

def main args
  
  require 'weather-api'
  
  woeid = $*.shift
  puts usage if woeid.nil?

  # look up WOEID via http://weather.yahoo.com; enter location by city
  # name or zip and WOEID is at end of resulting page url.
  # 'c' stands for Celsius
  response = Weather.lookup woeid, 'c'
  
  info = <<-EOS
  #{response.title}
  #{response.condition.temp} C
  #{response.condition.text}  
  #{response.forecasts[0].day} - #{response.forecasts[0].text}.  
    High: #{response.forecasts[0].high} Low: #{response.forecasts[0].low}
  #{response.forecasts[1].day} - #{response.forecasts[1].text}. 
    High: #{response.forecasts[1].high} Low: #{response.forecasts[1].low}
  EOS
  
  print info
  
  exit
end

def usage
  puts 'A Ruby wrapper for the Yahoo! Weather XML RSS feed'
  puts "usage: #{File.basename $0, '.rb'} [WOEID]"
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
