#!/usr/local/bin/ruby
# Have faith in the way things are.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'factorial'

if $0 == __FILE__
  begin
    input = ARGV.shift
    p input.to_i._!

    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
