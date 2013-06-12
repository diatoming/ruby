#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# benchmark.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# benchmarking :)
#
# == Usage
# benchmark.rb
#
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# testing class: Array
# testing methods: Array.average and Array.average_thread

# the class to test is in here :)
require './average'

require 'benchmark'

a = (0..5_000).to_a
TESTS = 10_000
Benchmark.bmbm do |res|
  res.report 'average' do TESTS.times do a.average end end
  res.report 'average_thread' do TESTS.times do a.average_thread end end
end

=begin
*** RESULTS:
Rehearsal --------------------------------------------------
average          3.460000   0.000000   3.460000 (  3.461142)
average_thread   4.130000   0.730000   4.860000 (  4.551825)
----------------------------------------- total: 8.320000sec

                     user     system      total        real
average          3.450000   0.000000   3.450000 (  3.459164)
average_thread   4.170000   0.740000   4.910000 (  4.587461)

*** CONCLUSION:
In this case, Array.average performs better than Array.average_thread. Or,
in this case, it's not worth to thread the calculation of averages with 
threads.
Besides, thread programming is difficult in other languages, so the code
may not be easy to implement in other prog. language.
=end