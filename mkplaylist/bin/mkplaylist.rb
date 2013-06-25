#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# mkplaylist.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# create a m3u playlist of media files in current dir
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

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'mkplaylist'

if $0 == __FILE__
  begin
    PLAY_LIST_NAME  = 'playlist.m3u'
    LABEL_COLOR     = 4
    media_files_ext = ['.flv','.mp4', '.MP4', '.mp3', '.avi', '.MP3', '.MOV',
                        '.m4a', '.wmv', '.mov', '.m4v','.mpg', '.f4v']

    rm_old_playlist
    file_lst = find_files_with_extensions media_files_ext
    write_playlist file_lst, PLAY_LIST_NAME
    label_file PLAY_LIST_NAME, LABEL_COLOR
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
