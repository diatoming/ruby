#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# tmpfile.rb
# released: Fri Dec 12 18:04:36 CET 2014
#++

#== Description
# example of tempfiles using Ruby's build in class
#
#== Run
# $ ruby ./tmpfile.rb
#
#== Author
# rimbaud1854
#
#== Copyright
# Copyright (c) 2014 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'tempfile'

file = Tempfile.new('foo')

# good practice: ALWAYS use the begin-ensure-end block!
begin
  file.path   # => A unique filename in the OS's temp directory,
              #    e.g.: "/tmp/foo.24722.0"
              #    This filename contains 'foo' in its basename.
  file.write("hello world")
  file.rewind
  p file.read   # => "hello world"
ensure
  file.close
  file.delete   # deletes the temp file
end
