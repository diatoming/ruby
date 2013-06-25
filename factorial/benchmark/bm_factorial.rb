#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# bm_factorial.rb
# current v.: 0.0.1
# date: 2013.06.25
#++

# == Description
# benchmarking factorial.rb
#
# == Usage
# bm_factorial.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'benchmark'
require 'factorial'

c_func = CCode.new

n = 20
TESTS = 1_000_000
Benchmark.bmbm do |res|
  res.report '._!' do TESTS.times do n._! end end
  res.report 'C factorial' do TESTS.times do c_func.factorial n end end
end

n = 1000
Benchmark.bmbm do |res|
  res.report '._!' do TESTS.times do n._! end end
end
