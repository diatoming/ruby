#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# msexcel.rb
# current v.: 0.0.1
# date: 2013.05.26
#++

# == Description
# example of the writeexcel gem
#
# == Usage
# msexcel.rb
#
# == Gem installation
# $ gem install writeexcel
#
# == Source
# https://github.com/cxn03651/writeexcel
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'writeexcel'

XCL_FILE = File.expand_path './ruby.xls'

# Create a new Excel Workbook
workbook = WriteExcel.new(XCL_FILE)

# Add worksheet(s)
worksheet  = workbook.add_worksheet
worksheet2 = workbook.add_worksheet

# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('red')
format.set_align('right')

# write a formatted and unformatted string.
worksheet.write(1, 1, 'Hi Excel.', format)  # cell B2
worksheet.write(2, 1, 'Hi Excel.')          # cell B3

# write a number and formula using A1 notation
worksheet.write('B4', 3.14159)
worksheet.write('B5', '=SIN(B4/4)')

# write to file
workbook.close
