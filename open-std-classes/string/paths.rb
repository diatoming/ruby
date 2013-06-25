#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# paths.rb
# current v.: 0.0.1
# date: 2013.05.24
#++

# == Description
# extend String class to work with file paths
#
# == Usage
# paths.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class String < Object
  
  def basename
    File.basename self
  end
  
  def expand_path
    File.expand_path self
  end
  
  def extname
    File.extname self
  end
  
  def rm_extname
    File.basename(self, (File.extname self))
  end
  
  def write_to_file file_path
    File.open file_path, 'w' do |f| f.write self end
  end
  
  alias :expand_tilde :expand_path
  alias :extension :extname
  alias :rm_extension :rm_extname
  
end


if $0 == __FILE__
  begin
    file_path = '~/Desktop'
    p file_path.basename
    p file_path.expand_path
    p file_path.expand_tilde

    file_path = __FILE__
    p file_path.basename
    p file_path.extname
    p file_path.extension
    p file_path.rm_extname
    p file_path.rm_extension

    file_path = '/dev/null'
    str = 'this is a test'

    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
