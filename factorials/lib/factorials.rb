#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# factorials.rb
# current v.: 0.0.1
# date: 2013.06.12
#++

# == Description
# calculation of factorial numbers
#
# == Usage
# factorials.rb
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2013 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

# when the file is loaded, then the look_up_table is loaded too.
# the hash look_up_hash will hold data
require 'json'

look_up_table_file = File.absolute_path './look_up.json'
$look_up_hash = {}

File.open look_up_table_file, 'r' do |file| 
  $look_up_hash = JSON.load(File.read file)
end


class Factorials < Object
  
  def Factorials.fact_1 n
    (2..n).inject :*
  end
  
  def Factorials.fact_2 n
    return 1 if n == 0 or n == 1
    return (2..n).inject :*
  end
  require 'Memoize'
  Memoize.register Factorials, 'fact_2'
  
  def Factorials.look_up n
    $look_up_hash[n.to_s]
  end
  
end

# global hash: to hold known factorials
$kfact = {0 => 1, 1 => 1}
class Fixnum
  def _!
    return $kfact[self] if $kfact.include? self
    res = (self - 1)._! * self
    $kfact[self] = res
    return res
  end
end

class CCode < Object
  
  require 'inline'
  
  inline do |builder|
    
    builder.include '<assert.h>'
    builder.include '<iso646.h>'
    builder.include '<limits.h>'
    
    builder.add_compile_flags '-O2'
    
    builder.c <<-EOS
    /*
    NAME:   fact
    INPUT:  integer whose factorial is to be calculated
    OUTPUT: factorial of input
    *
    NOTES:
    by trial and error :( the max input is n = 20, which produces a 
    value of fact(20) = 2432902008176640000. If n = 21 is used, then 
    the code produces incorrect values for fact(21) or more.
    */
    unsigned long fact(unsigned long n) 
    {
        unsigned long _MAX_INPUT  = 20;
        unsigned long _MAX_OUTPUT = 2432902008176640000;
        
        assert(sizeof(unsigned long) == sizeof(n));
        assert(n >= 0 and n <= _MAX_INPUT);
        
        unsigned long i   = n;
        unsigned long res = 1;
        
        while (i >= 2)
          res *= i--; 
        
        assert(res <= _MAX_OUTPUT);
        
        return res;
    }
    EOS
  end

end


def main args
  n = 20
  
  c_code = CCode.new
  
  p "Fact. class method 'fact_1':  #{Factorials::fact_1 n}"
  p "Fact. class method 'fact_2':  #{Factorials::fact_2 n}"
  p "Fact. class method 'look_up': #{Factorials::look_up n}"
  p "Fixnum method '_!':           #{n._!}"
  p "CCode method: 'fact':         #{c_code.fact n}"
  
  exit
end

if $0 == __FILE__
  begin
    exit main $*
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
