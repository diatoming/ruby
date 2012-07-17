#--
# Have faith in the way things are.
#
# yaml_manager.rb
# current v.:  0.0.1
#++

# == Description
# simple manager of YAML files
#
# == Example
# filename  = 'test.txt'
# data      = {one: 'string', two: 'another string'}
#
# manager = YAMLManager.new
# manager << filename
# manager.write_data data
# p manager.read_data
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 RimbaudCode
# Licensed under GPLv3+. No warranty provided.

module YAMLManager
  
  class Manager < Object

    require 'yaml'

    def << filename
      @filename = filename
    end

    alias :add_file :<<

    def write_data data
      File.open @filename, 'w' do |file| 
        file.write data.to_yaml
      end
    end

    def read_data
      File.open @filename, 'r' do |file| 
        YAML::load(File.read @filename)
      end
    end

  end
  
end
