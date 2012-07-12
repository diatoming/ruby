#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

# file_extensions.rb
# extensions to Ruby File module
# Copyright 2012 RimbaudCode
# License: GPLv3+

class File
  # return dirname and basename of a given path
  def self.path_components path
    path = File.expand_path path
    [(dirname path), (basename path)]
  end
end
