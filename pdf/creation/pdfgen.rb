#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# pdfgen.rb
# date: 2014.02.03
#++

# == Description
# pdf generation using the prawn gem
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require "prawn"

Prawn::Document.generate("hello.pdf") do
  text "Hello World!"
end
