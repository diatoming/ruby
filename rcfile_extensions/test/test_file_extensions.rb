#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

require 'test/unit'
require '../../test_unit_extensions/test_unit_extensions'
require '../lib/file_extensions'

class TestFile < Test::Unit::TestCase

  def setup
    @path = __FILE__
  end

  must '(path_components) return known output for known input' do 
    exp_dirname = '/Users/art/SugarSync/code/ruby/rcfile_extensions/test'
    exp_basename = 'test_file_extensions.rb'
    exp_output = [exp_dirname, exp_basename]

    assert_equal(exp_output, (File.path_components @path))
  end

end