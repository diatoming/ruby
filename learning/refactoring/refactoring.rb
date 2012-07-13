#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

class Test < Object
  # methods with similar functionality that need to be created at once!
  methods = [:jump, :walk, :hide, :run]

  methods.each do |method| 
    define_method "#{method}" do
      p "#{method}"
    end
  end
  
end

obj = Test.new
# notice the 1st methods!
p obj.methods

# call all the created methods at once!
methods = [:jump, :walk, :hide, :run]
methods.each do |method| 
  obj.send "#{method}"
end
