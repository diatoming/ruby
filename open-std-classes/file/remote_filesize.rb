#!/usr/local/bin/macruby -w
#--
# Have faith in the way things are.
#
# remote_filesize.rb
# current v.: 0.0.1
# date: 2013.06.02
#++

# == Description
# get size of remote files
#
# == Usage
# remote_filesize.rb
#
# == Compilation
# macrubyc remote_filesize.rb -o remote_filesize
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

framework 'Foundation'

url_string = 'http://www.macruby.org/files/nightlies/macruby_nightly-latest.pkg' 

url = NSURL.URLWithString url_string
#p url.fragment
#p url.host
#p url.path

require 'net/http'
require 'uri'

Net::HTTP.start url.host do |http|
  response = http.request_head url.path
  file_size = response['content-length']
  p file_size
end
