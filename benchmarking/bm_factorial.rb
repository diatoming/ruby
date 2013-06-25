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
 
n = 20
ccode = CCode.new

TESTS = 10_000
Benchmark.bmbm do |res|
  res.report 'recursive:' do TESTS.times {factorial_recursive(n)} end
  res.report 'tail recursive:' do TESTS.times {factorial_tail_recursive(n)} end
  res.report 'iterative:' do TESTS.times {factorial_iterative(n)} end
  res.report 'inject:' do TESTS.times {factorial_inject(n)} end
  res.report 'reduce:' do TESTS.times {factorial_reduce(n)} end
  res.report 'memoization:' do TESTS.times {factorial_memoization(n)} end
  res.report 'c-inline:' do TESTS.times {ccode.factorial(n)} end
end

puts ""
puts ""

n = 400
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
recursive:        0.040000   0.000000   0.040000 (  0.042295)
tail recursive:   0.050000   0.000000   0.050000 (  0.060328)
iterative:        0.040000   0.000000   0.040000 (  0.041022)
inject:           0.070000   0.000000   0.070000 (  0.069144)
reduce:           0.050000   0.000000   0.050000 (  0.050192)
memoization:      0.000000   0.000000   0.000000 (  0.004674)
c-inline:         0.010000   0.000000   0.010000 (  0.002688)
------------------------------------------ total: 0.260000sec

                      user     system      total        real
recursive:        0.040000   0.000000   0.040000 (  0.041619)
tail recursive:   0.050000   0.000000   0.050000 (  0.052377)
iterative:        0.040000   0.000000   0.040000 (  0.039066)
inject:           0.070000   0.000000   0.070000 (  0.065702)
reduce:           0.050000   0.000000   0.050000 (  0.049526)
memoization:      0.010000   0.000000   0.010000 (  0.004595)
c-inline:         0.000000   0.000000   0.000000 (  0.002635)


Rehearsal ---------------------------------------------------
recursive:        6.370000   0.050000   6.420000 (  6.475088)
tail recursive:   7.000000   0.090000   7.090000 (  7.152011)
iterative:        6.640000   0.060000   6.700000 (  6.812381)
inject:           7.110000   0.060000   7.170000 (  7.316541)
reduce:           6.040000   0.050000   6.090000 (  6.199300)
memoization:      0.000000   0.000000   0.000000 (  0.005725)
----------------------------------------- total: 33.470000sec

                      user     system      total        real
recursive:        6.380000   0.060000   6.440000 (  6.487431)
tail recursive:   7.450000   0.060000   7.510000 (  7.568471)
iterative:        6.530000   0.040000   6.570000 (  6.628201)
inject:           6.950000   0.050000   7.000000 (  7.043341)
reduce:           6.010000   0.040000   6.050000 (  6.092817)
memoization:      0.000000   0.000000   0.000000 (  0.004701)

=end
