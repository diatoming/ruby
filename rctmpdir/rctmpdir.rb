#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# rctmpdir.rb
# v.: 0.0.1
#++

# == Description
# locate and open the tmp folder in OSX (Lion)
#
# == Usage
# rctmpdir.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

#require 'FileUtils'
require 'tmpdir'

tmp = Dir.tmpdir
FileUtils.cd tmp
p tmp
`open #{tmp}`
p 'look for size and FlashTmp.*'
p 'cp to Desktop and rename'
