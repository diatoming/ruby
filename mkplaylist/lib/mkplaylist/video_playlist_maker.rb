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

class VideoPlaylistMaker < Object
  
  FILE_COLORER      = '~/SkyDrive/Apps/bin/filecolorer'
  FILE_COLORER_PATH = File.expand_path(FILE_COLORER)
  
  PLAYLIST_HEADER    = '#EXTM3U'
  PLAYLIST_XTR_INFO  = '#EXTINF'
  
  def initialize playlist_filename, media_files_ext, file_label_color = 1
    @file_label_color  = file_label_color
    @media_files_ext   = media_files_ext
    @playlist_filename = playlist_filename
    
    @media_filenames = []
  end
  
  def color_playlist_file
    `#{FILE_COLORER_PATH} #{@playlist_filename} #{@file_label_color}`
  end
  
  def find_media_files
    @media_files_ext.each do |ext|
      @media_filenames << Dir.glob("**/*.#{ext}")
    end
    @media_filenames.flatten.sort
  end
  
  def rm_playlist
    File.delete @playlist_filename if File::exists? @playlist_filename
  end
  
  # write playlist using the '.m3u' format
  #--
  # '.m3u' file format prototype:
  # #EXTM3U - header - must be first line of file
  # #EXTINF - extra info - length (seconds), title
  def playlist_to_file
    
    @media_filenames = self.find_media_files
    
    File.open @playlist_filename, 'w' do |f| 
      f.puts PLAYLIST_HEADER
      @media_filenames.each do |file| 
        f.puts "#{PLAYLIST_XTR_INFO}: #{file}"
        f.puts "#{file}"
      end
    end
  end
  
end
