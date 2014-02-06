#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# metadata.rb
# date: 2014.02.03
#++

# == Description
# metadata creating using the prawn gem
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require "prawn"

Prawn::Document.generate("metadata.pdf",
  :info => {
    :Title        => "Another title",
    :Author       => "John Doe",
    :Subject      => "My Subject",
    :Keywords     => "test metadata ruby pdf dry",
    :Creator      => "ACME Soft App", 
    :Producer     => "Prawn",
    :CreationDate => Time.now
  }) do
  
  text "This is a test of setting metadata properties via the info option."
  text "While the keys are arbitrary, the above example sets common attributes."
end
