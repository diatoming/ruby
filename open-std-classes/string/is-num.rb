#--
# lib_rcisnum.rb
# init. rel.:  2012.06.01
# current v.:  0.0.1
#++

# Extensions to String to test if a string contains numeric values
#
# == Description
# Extensions to String to test if a string contains numeric values
#
# == Example
# '10'.is_int?                    # --> true
# "aoeu".is_float?                # --> false
#
# == Author
# Arthur Rimbaud, RimbaudCode
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

class String
  
  def is_float?
    !!Float(self) rescue false
  end
  
  def is_int?
    !!Integer(self) rescue false
  end
  
end


def main args
  puts "".is_int?
  puts "1".is_int?
  puts "".is_float?
  puts "1.0".is_float?
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

