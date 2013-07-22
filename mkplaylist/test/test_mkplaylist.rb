#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# test_factorial.rb
# date: 2013.06.25
#++

# == Description
# testing video_playlist_maker.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'test/unit'
require 'test_unit_extensions'
require 'mkplaylist/video_playlist_maker'

class TestVideoPlaylistMaker < Test::Unit::TestCase
  
  PLAYLIST_FILE_NAME = 'playlist.m3u'
  MEDIA_FILES_EXT = ['avi', 'f4v', 'flv', 'm4a', 'm4v', 'mov', 
    'mp3', 'mp4', 'mpg', 'wmv']
  
  def setup
    @pl_mkr = VideoPlaylistMaker.new PLAYLIST_FILE_NAME, MEDIA_FILES_EXT
  end
  
  must 'not be nil' do
    assert_not_nil @pl_mkr
  end
  
  must 'respond to methods' do  
    method_list = ['color_playlist_file', 'find_media_files',
      'rm_playlist', 'playlist_to_file']
    method_list.each do |method|
      assert_true(@pl_mkr.respond_to? method.to_sym)
    end
  end
  
end
