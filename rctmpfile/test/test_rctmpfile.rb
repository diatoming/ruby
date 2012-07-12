#!/usr/local/bin/ruby -w
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/rctmpfile'

class TestTmpFile < Test::Unit::TestCase

  def setup
    @tmp = TmpFile.new 'test.txt'
  end
  
  must 'be not nil' do
    assert_not_nil @tmp
  end

  must 'be instance of TmpFile class' do 
    assert_instance_of TmpFile, @tmp
  end

  must 'respond to its methods' do
    methods = %w(close cp_to folder open_folder path read write)
    methods.each do |m| 
      assert_respond_to @tmp, m
    end
  end

  must 'return known path' do
    known_path = File::dirname '/var/folders/yb/bw6ggyfj1xj2z_h_t_x3jc8r0000gn/T/test.txt'
    actual_path = File::dirname @tmp.path
    assert_equal known_path, actual_path
  end

  must 'return known folder' do
    known_folder = '/var/folders/yb/bw6ggyfj1xj2z_h_t_x3jc8r0000gn/T'
    actual_folder = @tmp.folder
    assert_equal known_folder, actual_folder
  end

  must 'not raise anything while writing to tmpfile' do
    assert_nothing_raised Exception do @tmp.write 'this is a test.' end
  end
  
  must 'return known str when reading from tmpfile' do
    known_str = 'this is a test'
    @tmp.write known_str
    assert_equal known_str, @tmp.read
  end
  
  must 'copy file to ~/Desktop' do
    @tmp.cp_to '~/Desktop'
    assert File.exists? File.expand_path '~/Desktop/test.txt'
  end
  
  must 'not raise anything when closing tmpfile' do
    assert_nothing_raised Exception do @tmp.close end
  end

end
