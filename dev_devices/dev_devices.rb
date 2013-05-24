#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# dev_devices.rb
# current v.: 0.0.1
# date: 2013.05.24
#++

# == Description
# usage of /dev/random, /dev/urandom, secure random
# /dev/null and /dev/full devices
#
# == Usage
# dev_devices.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# /dev/random and /dev/urandom using the od bash command
# see $ man od for more information
p `od -vAn -N4 -tu4 </dev/urandom`.to_i
p `od -An -N2 -i /dev/random`.to_i

# secure random
require "securerandom"

p SecureRandom.hex
p SecureRandom.base64
p SecureRandom.random_number 100 # less or equal than
p SecureRandom.uuid              # universally unique identifier

# /dev/null aka black hole!
file_path = '/dev/null'
str = 'this is a test'

File.open file_path, 'w' do |file| 
  file.write str
end

# /dev/full permission denied error
`echo "test string" >/dev/full`

# /dev/full permission denied error
file_path = '/dev/full'
str = 'this is a test'

File.open file_path, 'w' do |file| 
  file.write str
end

