#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# fixpermissions.rb
# date: 2014.03.31
#++

# == Description
# fix permissions on OneDrive folder
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

ONE_DRIVE_PATH        = '/Users/art/OneDrive'
EXECUTABLE_FILES_PATH = '/Users/art/OneDrive/Apps/bin'

def change_to_path path
  Dir.chdir path
end

def fix_dir_permissions
  `find . -type d -exec chmod 755 {} \\;`
end

def fix_executable_files_permissions
  `find . -type f -exec chmod 755 {} \\;`
end

def fix_file_permissions
  `find . -type f -exec chmod 644 {} \\;`
end

# http://stackoverflow.com/questions/4833052/\
# how-do-i-remove-the-extended-attributes-on-a-file-in-mac-osx
def remove_extended_attributes
  `xattr -rd com.apple.quarantine #{ONE_DRIVE_PATH}`
end


def main args
  puts "changing path to #{ONE_DRIVE_PATH}"
  change_to_path ONE_DRIVE_PATH
  puts "removing extended attributes..."
  remove_extended_attributes
  puts "fixing dir permissions..."
  fix_dir_permissions
  puts "fixing file permissions..."
  fix_file_permissions
  puts "changing path to #{EXECUTABLE_FILES_PATH}"
  change_to_path EXECUTABLE_FILES_PATH
  puts "fixing executable files permissions..."
  fix_executable_files_permissions
  exit
end


if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
