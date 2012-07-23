#!/usr/local/bin/ruby -w
#--
# Have faith in the way things are.
#
# rctex_cleaner.rb
# v.: 0.0.1
#++

# == Description
# remove auxiliary files produced by TeX and Co.
#
# == Usage
# ruby rctex_cleaner.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

require 'FileUtils'

patterns = ['*.aux', '*.log', '*.synctex.gz', '*.toc']
patterns.each do |pattern| FileUtils.rm Dir.glob(pattern) end
