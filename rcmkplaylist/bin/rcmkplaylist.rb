#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# rcmkplaylist.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# create a m3u playlist of media files in current dir
#
# == Description
# create a m3u playlist of media files in current dir
#
# == Usage
# ruby rcmkplaylist.rb
#
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.



if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')
    
    require 'lib_rcmkplaylist'
    
    PLAY_LIST_NAME  = 'playlist.m3u'
    LABEL_COLOR     = 4
    media_files_ext = ['.flv','.mp4', '.MP4', '.mp3', '.avi', '.MP3', '.MOV',
                        '.m4a', '.wmv', '.mov', '.m4v','.mpg']

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
