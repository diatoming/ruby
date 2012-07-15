#--
# test_unit_extensions.rb
#
# == Description
# This modules extends Test::Unit to include the 'must' method
#
# == Author
# Gregory Brown
#
# == Source
# Gregory Brown, Ruby Best Practices. O’Reilly Media, Inc. 2009
#
# == Copyright
# Copyright (c) 2009 Gregory Brown. All rights reserved.
#++

module Test::Unit
  # Used to fix a minor minitest/unit incompatibility in flexmock 
  AssertionFailedError = Class.new(StandardError)
  
  class TestCase
   
    def self.must(name, &block)
      test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
      defined = instance_method(test_name) rescue false
      raise "#{test_name} is already defined in #{self}" if defined
      if block_given?
        define_method(test_name, &block)
      else
        define_method(test_name) do
          flunk "No implementation provided for #{name}"
        end
      end
    end

  end
end
