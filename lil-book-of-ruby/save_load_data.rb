#!/usr/local/bin/ruby -w

# create an array and save it to a file in the current dir

in_array = (0..100).to_a
p in_array

# use yaml module
require 'yaml'

# save data onto disk in yaml format
def save_data_to_file data, file
  File.open file, 'w' do |f| 
    f.write data.to_yaml 
  end
end

# write to file
file_name = 'test.txt'
save_data_to_file in_array, file_name

# load array from file
def load_data_from_file file
  in_data = File.read file
  data = YAML::load in_data
  data
end

# load data: first verify the file exists!
if File.exist? file_name then
  array = load_data_from_file file_name
  p array
else
  NoFileFoundError = Class.new StandardError
  raise NoFileFoundError
end 

