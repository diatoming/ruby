#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tmpdir.rb
# date: 2013.06.25
#++

# == Description
# locate and open the tmp folder in OSX (Lion)
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'tmpdir'

tmp = Dir.tmpdir
FileUtils.cd tmp
p tmp
`open #{tmp}`
p 'look for size and FlashTmp.*'
p 'cp to Desktop and rename'
