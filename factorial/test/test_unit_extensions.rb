#--
# == Description
# adds the awesome 'must' method to unit tests ;)
#
# Usage:
# must "return 3628800" do
#   assert_equal(3628800, 10._!)
# end
#
# == Author
# Gregory Brown
# 
# == Source
# https://github.com/sandal/rbp/blob/master/testing/\
# test_unit_extensions.rb
#
# == Copyright
# Copyright (c) Gregory Brown
#++

module Test::Unit
  
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
