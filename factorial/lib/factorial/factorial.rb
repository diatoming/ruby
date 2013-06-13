#!/usr/local/bin/ruby
# Have faith in the way things are.

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


module Factorial
  
  class Factorial
    def Factorial.fact_1 n
      (2..n).inject :*
    end
    def Factorial.fact_2 n
      return 1 if n == 0 or n == 1
      return (2..n).inject :*
    end
    require 'Memoize'
    Memoize.register Factorial, 'fact_2'
  end

  class CCode

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
  
end


if $0 == __FILE__
  begin
    n = 20

    c_code = Factorial::CCode.new

    p "Fact. class method 'fact_1':  #{Factorial::Factorial::fact_1 n}"
    p "Fact. class method 'fact_2':  #{Factorial::Factorial::fact_2 n}"
    p "Fixnum method '_!':           #{n._!}"
    p "CCode method: 'fact':         #{c_code.fact n}"

    exit
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    abort
  ensure
    #
  end
end
