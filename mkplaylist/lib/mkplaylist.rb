#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# mkplaylist.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# m3u playlist of media files creator
#
# == Usage
# mkplaylist.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

NonArrayArgumentError = Class.new StandardError

LABEL_FILE = '~/SkyDrive/Apps/filecolorer'
LABEL_PATH = File.expand_path(LABEL_FILE)

# remove any pre-existing playlist file
def rm_old_playlist playlist_name='playlist.m3u'
  require 'FileUtils'
  FileUtils::rm playlist_name if File::exists? playlist_name
end

# find media files with a given list of extensions
def find_files_with_extensions ext_lst
  require 'Find'
  raise NonArrayArgumentError unless ext_lst.is_a? Array
  lst = []
  ext_lst.each do |ext| 
    Find.find './' do |f| 
      lst << f if f.match(/#{Regexp.escape(ext)}/)
    end
  end
  lst.flatten.sort
end

#write playlist using the '.m3u' format
#--
# '.m3u' file format prototype:
# #EXTM3U - header - must be first line of file
# #EXTINF - extra info - length (seconds), title
def write_playlist file_lst, playlist_name
  raise NonArrayArgumentError unless file_lst.is_a? Array
  return nil if file_lst.empty?
  header   = '#EXTM3U'
  xtr_info = '#EXTINF'
  File.open playlist_name, 'w' do |f| 
    f.puts header
    file_lst.each do |file| 
      f.puts "#{xtr_info}: #{file}"
      f.puts "#{file}"
    end
  end
end

def label_file file, label
  `#{LABEL_PATH} #{file} #{label}`
end
