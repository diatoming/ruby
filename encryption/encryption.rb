#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# encryption.rb
# date: 2014.02.10
#++

# == Description
# string encryption with AESCrypt
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require './lib/aescrypt'

message  = "top secret message"
password = "p4ssw0rd"

puts "Before encryption: #{message}"

encrypted_data = AESCrypt.encrypt(message, password)
puts "After encryption: #{encrypted_data}"

message = AESCrypt.decrypt(encrypted_data, password)
puts "After decryption: #{message}"
