#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# rcfile_remover.rb
# v.: 0.0.1
#++

# == Description
# remove files with a given pattern
#
# == Usage
# ruby file_remover.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

class FileRemover < Object
  
  require 'FileUtils'
  
  def initialize pattern='._*'
    @pattern     = pattern
    @files_to_rm = []
  end
  
  def find_files
    files = File.join("**", @pattern)
    @files_to_rm = Dir.glob(files)
  end
  
  def rm_files
    find_files
    @files_to_rm.each do |file| FileUtils.rm file end
  end
  
  def files_to_rm
    @files_to_rm
  end
  
  def confirm_removal
    find_files
    @files_to_rm
  end
        
end


def main args
  pattern = '._*'
  dir     = FileUtils.pwd
  #
  puts "> removing files with pattern #{'._*'} in\n\t#{dir}"
  #
  file_remover = FileRemover.new pattern
  file_remover.find_files
  #
  puts '> files to remove...'
  p file_remover.files_to_rm
  file_remover.rm_files
  #
  puts '> confirmation of removal...'
  p file_remover.confirm_removal
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
