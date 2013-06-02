#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# change_extname.rb
# current v.: 0.0.1
# date: 2013.06.02
#++

# == Description
# change the extension name of a file
#
# == Usage
# change_extname.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class String < Object
  
  def change_path_extname new_extname
    old_path = File.absolute_path(File.expand_path self)
    new_path = (File.basename old_path, 
                (File.extname old_path)) + new_extname
    File.absolute_path new_path
  end
  
end


def main args
  
  old_path = './test.txt'
  new_extname = '.json'
  
  p old_path.change_path_extname new_extname
  
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


