#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# filesize.rb
# current v.: 0.0.1
# date: 2013.05.22
#++

# == Description
# display file sizes in MB
#
# == Usage
# filesize.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class File < Object
  
  B_TO_MB_FACTOR = 1000
  
  def self.size_in_mb file
    (File.size file).to_f / B_TO_MB_FACTOR
  end
  
end


def main args
  p File.size_in_mb __FILE__
  0
end

if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
