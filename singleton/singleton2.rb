#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

# http://www.oreillynet.com/ruby/blog/2006/01/design_patterns_singleton.html
require 'singleton'

class Hermit
  
  include Singleton
  
end

# a = Hermit.new    #raises an exception
a = Hermit.instance
p a.inspect
