#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

#--
# rcmkruby.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# This tool encapsulates the functionality related to create ruby
# projects files and folders
#
# == Description
# create ruby projects files and folders
#
# == Usage
# ruby rcmkruby.rb projectname
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

def usage
  puts 'create ruby projects files and folders'
  puts "usage: #{File.basename $0, '.rb'} projectname"
  exit 0
end


def main
  $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')
  
  #require ''
  
  projectname = $*.shift
  
  usage if projectname.nil?
  
  basename = File.basename projectname
  
  # create folders
  `mkdir -p ./#{basename} ./#{basename}/bin ./#{basename}/lib ./#{basename}/test`
  
  # create files in folders
  `touch ./#{basename}/bin/#{basename}.rb` 
  `touch ./#{basename}/lib/lib_#{basename}.rb` 
  `touch ./#{basename}/test/test_lib_#{basename}.rb`
end


if $0 == __FILE__
  begin
    main
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
