#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# mkplaylist.rb
# date: 2013.07.21
#++

# == Description
# mk a .m3u playlist with media files
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'mkplaylist'

if $0 == __FILE__
  begin
    PLAYLIST_FILE_NAME = 'playlist.m3u'
    
    MEDIA_FILES_EXT = ['flv','mp4', 'MP4', 'mp3', 'avi', 'MP3', 'MOV', 
      'm4a', 'wmv', 'mov', 'm4v','mpg', 'f4v']
    
    pl_mkr = VideoPlaylistMaker.new PLAYLIST_FILE_NAME, MEDIA_FILES_EXT
    pl_mkr.rm_playlist
    pl_mkr.find_media_files
    pl_mkr.playlist_to_file
    pl_mkr.color_playlist_file
    
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
