#--
# lib_rctmpfile.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# This class encapsulates the functionality related to
# temporary file creation
#
# == Description
# create a temporary file using the OS tmp folder facilities
#
# == Example
# 
# 
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

class TmpFile < Object

  require 'tempfile'

  def initialize name
    @name = name
    @tmpfile = Tempfile.new name
  end

  def close
    @tmpfile.close
    @tmpfile.unlink
  end

  def cp_to path
    path = File.expand_path path
    dest_path = File::join path, (File::basename @name)
    FileUtils.cp @tmpfile.path, dest_path
  end

  def folder
    File::dirname @tmpfile
  end

  def open_folder
    `open #{folder}`
  end

  def path
    @tmpfile.path
  end

  def read
    @tmpfile.rewind
    @tmpfile.read
  end

  def write str
    @tmpfile.write str
  end

end
