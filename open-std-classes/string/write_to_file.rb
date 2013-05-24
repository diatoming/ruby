#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# write_to_file.rb
# current v.: 0.0.1
# date: 2013.05.24
#++

# == Description
# extend String class to write its contents to files
#
# == Usage
# write_to_file.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.


class String < Object
  
  def to_file file_path
    begin
      File.open file_path, 'w' do |file| file.write self end
    rescue Exception => e
      abort e.message
    end
  end
  
  alias :write_to_file :to_file
  
end


def main args
  file_path = '/dev/null'
  str = 'this is a test'
  
  str.to_file file_path
  str.write_to_file file_path
  
  # this will generate an exception :)
  file_path = '/dev/full'
  
  str.to_file file_path
  
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
