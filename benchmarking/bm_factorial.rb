#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# bm_factorial.rb
# date: 2013.06.25
#++

# == Description
# benchmarks for different implementations of 'factorial'
#
# == Source
# http://rosettacode.org/wiki/Factorial#Ruby
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

$LOAD_PATH << File.expand_path(File.join(__dir__, './'))

require 'benchmark'
require 'factorial'
 
n = 400
TESTS = 10_000
Benchmark.bmbm do |res|
  res.report 'recursive:' do TESTS.times {factorial_recursive(n)} end
  res.report 'tail recursive:' do TESTS.times {factorial_tail_recursive(n)} end
  res.report 'iterative:' do TESTS.times {factorial_iterative(n)} end
  res.report 'inject:' do TESTS.times {factorial_inject(n)} end
  res.report 'reduce:' do TESTS.times {factorial_reduce(n)} end
  res.report 'memoization:' do TESTS.times {factorial_memoization(n)} end
end
 
=begin

Rehearsal ---------------------------------------------------
recursive:        5.170000   0.160000   5.330000 (  5.380250)
tail recursive:   5.820000   0.200000   6.020000 (  6.173687)
iterative:        5.080000   0.160000   5.240000 (  5.326598)
inject:           5.600000   0.160000   5.760000 (  5.820470)
reduce:           4.900000   0.170000   5.070000 (  5.110983)
memoization:      0.000000   0.000000   0.000000 (  0.005209)
----------------------------------------- total: 27.420000sec

                      user     system      total        real
recursive:        5.110000   0.160000   5.270000 (  5.319179)
tail recursive:   5.890000   0.200000   6.090000 (  6.249730)
iterative:        5.170000   0.160000   5.330000 (  5.381382)
inject:           5.620000   0.160000   5.780000 (  5.833114)
reduce:           4.960000   0.160000   5.120000 (  5.176486)
memoization:      0.000000   0.000000   0.000000 (  0.004362)

=end
