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

PATTERNS = %w(*.aux *.bbl *.blg *.dvi *.log *.synctex.gz *.toc *.out)

# find files recursively and delete them
PATTERNS.each do |pattern|
  find_files = File.join("**", pattern) 
  files_to_rm = Dir.glob(find_files)
  files_to_rm.each do |file| FileUtils.rm file end
end
