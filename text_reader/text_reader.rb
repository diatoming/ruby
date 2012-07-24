#!/usr/local/bin/macruby -w
#--
# Have faith in the way things are.
#
# text_reader.rb
# v.: 0.0.1
#++

# == Description
# text-to-speech tool that uses the OSX shell command 'say'
#
# == Usage
# text_reader.rb [text]
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

module RCTextReader

  class TextReader < Object
    
    def initialize text
      @text = text
    end
    
    def read
      `say #{@text}`
    end
    
  end

end


def main args
  
  usage if $*.empty?
  
  reader = RCTextReader::TextReader.new $*.join ' '
  reader.read
  0
end

def usage
  puts 'text-to-speech tool'
  puts "usage: text_reader.rb text"
  exit 0
end


if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end

