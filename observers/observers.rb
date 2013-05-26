#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

# http://www.oreillynet.com/ruby/blog/2006/01/ruby_design_patterns_observer.html
require 'observer'  # Key step 1

class MyObservableClass
  include Observable  # Key step 2

  def blah
    changed  # note that our state has changed
    notify_observers( 5 )
  end
end

class MyObserverClass
  def update(new_data)  # Key step 3
    puts "The new data is #{new_data}"
  end
end

watcher = MyObservableClass.new
watcher.add_observer(MyObserverClass.new)
