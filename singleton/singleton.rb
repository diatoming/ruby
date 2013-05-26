#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

class MyLogger < Object
  # .new method is now private
  private_class_method :new
  @@logger = nil
  
  def self.create
    @@logger = new unless @@logger
    @@logger
  end
  
end

# calling .new raises an exception, because it's private!
# logger = MyLogger.new

# .create should be use instead of .new
logger = MyLogger.create
p logger.object_id

another_logger = MyLogger.create
p another_logger.object_id

p 'logger and another_logger equal? ' + (logger == another_logger).to_s
