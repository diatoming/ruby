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

* MacBook Pro. 
* Processor: 2.4 GHz Intel Core i5. 
* Memory: 8 GB 1333 MHz DDR3

Rehearsal ---------------------------------------------------
recursive:        0.030000   0.000000   0.030000 (  0.023198)
tail recursive:   0.020000   0.000000   0.020000 (  0.024472)
iterative:        0.020000   0.000000   0.020000 (  0.018500)
inject:           0.030000   0.000000   0.030000 (  0.032790)
reduce:           0.030000   0.000000   0.030000 (  0.024093)
memoization:      0.000000   0.000000   0.000000 (  0.002220)
c-inline:         0.000000   0.000000   0.000000 (  0.001361)
------------------------------------------ total: 0.130000sec

                      user     system      total        real
recursive:        0.020000   0.000000   0.020000 (  0.021399)
tail recursive:   0.020000   0.000000   0.020000 (  0.024196)
iterative:        0.020000   0.000000   0.020000 (  0.017290)
inject:           0.030000   0.000000   0.030000 (  0.026988)
reduce:           0.020000   0.000000   0.020000 (  0.019284)
memoization:      0.010000   0.000000   0.010000 (  0.001948)
c-inline:         0.000000   0.000000   0.000000 (  0.001005)


Rehearsal ---------------------------------------------------
recursive:        2.990000   0.120000   3.110000 (  3.109807)
tail recursive:   3.570000   0.150000   3.720000 (  3.716942)
iterative:        2.980000   0.100000   3.080000 (  3.090355)
inject:           3.220000   0.110000   3.330000 (  3.329217)
reduce:           2.820000   0.120000   2.940000 (  2.934556)
memoization:      0.000000   0.000000   0.000000 (  0.002951)
----------------------------------------- total: 16.180000sec

                      user     system      total        real
recursive:        2.980000   0.110000   3.090000 (  3.092025)
tail recursive:   3.490000   0.140000   3.630000 (  3.637170)
iterative:        3.040000   0.100000   3.140000 (  3.146258)
inject:           3.220000   0.110000   3.330000 (  3.335647)
reduce:           2.890000   0.110000   3.000000 (  3.007226)
memoization:      0.000000   0.000000   0.000000 (  0.001949)

=end
