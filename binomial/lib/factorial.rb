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
