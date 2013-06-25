#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# titlecase.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# uppercase first letters of words
#
# == Usage
# titlecase.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

class String
  #  Dave Thomas and Andrew Hunt. Programming Ruby
  def titlecase
    gsub(/\b\w/) {|first| first.upcase }
  end
  def titlecase!
    gsub!(/\b\w/) {|first| first.upcase }
  end
end


if $0 == __FILE__
  begin
    puts "this is a string".titlecase
    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end

