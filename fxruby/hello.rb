#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# hello.rb
# date: 2014.04.09
#++

# == Description
# creating GUIs with FXRuby
#
# == Installation
# $ brew install fox
# $ sudo gem install fxruby
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'fox16'

include Fox

application = FXApp.new("Hello", "FoxTest")
main        = FXMainWindow.new(application, "Hello", nil, nil, DECOR_ALL)

FXButton.new(main, "&Hello, World!", nil, application, FXApp::ID_QUIT)

application.create()
main.show(PLACEMENT_SCREEN)
application.run()
