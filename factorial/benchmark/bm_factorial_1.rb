#!/usr/local/bin/ruby
# Have faith in the way things are.

$LOAD_PATH << File.expand_path(File.join(__dir__, '../lib'))

require 'benchmark'
require 'factorial.rb'

n = 20
TESTS = 500_000

c_code = Factorial::CCode.new

puts "Benchmarking results for the lib 'factorials.rb'"
puts ""
puts "Test values to compare every method result"
puts ""
puts "Factorials calculated for n = #{n}"
puts ""
puts "Values:"
puts "Fact. class method 'fact_1':  #{Factorial::Factorial::fact_1 n}"
puts "Fact. class method 'fact_2':  #{Factorial::Factorial::fact_2 n}"
puts "Fixnum method '_!':           #{n._!}"
puts "CCode method: 'fact':         #{c_code.fact n}"
puts ""
puts "Benchmarks for n = #{n} and #{TESTS} tests"
puts ""

Benchmark.bmbm do |results|
  results.report "Factorials class method 'fact_1':" do 
    TESTS.times do Factorial::Factorial::fact_1 n end 
  end
    
  results.report "Factorials class method 'fact_2':" do 
    TESTS.times do Factorial::Factorial::fact_2 n end 
  end
  
  results.report "Fixnum method '_!':" do 
    TESTS.times do n._! end 
  end
  
  results.report "CCode method: 'fact':" do 
    TESTS.times do c_code.fact n end 
  end
end
