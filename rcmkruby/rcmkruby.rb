#!/usr/local/bin/macruby -w
# Have faith in the way things are.

DIR_TREE      = ['bin', 'examples', 'lib', 'man', 'test']
README_FILE   = 'README.md'
TEMPLATE_PATH = 'templates'
TEMPLATE_FILE_PATHS = {
  main: "main.rb", 
  exceptions: "exceptions.rb", 
  version: "version.rb",
  test_unit_extensions: "test_unit_extensions.rb",
  test_main: "test_main.rb"
}


class DirBuilder < Object
  
  require 'FileUtils'
  
  def initialize proj_name
    @proj_name = proj_name
    @root_dir  = @proj_name
  end
  
  def mkdir_tree
    FileUtils.mkdir "#{@root_dir}"
    DIR_TREE.each do |dir| FileUtils.mkdir "#{@root_dir}/#{dir}" end
    FileUtils.mkdir "#{@root_dir}/lib/#{@proj_name}"
  end
      
end


class ReadMeWriter < Object
  
  def initialize proj_name
    @proj_name    = proj_name
    @readme_path  = "#{@proj_name}/#{README_FILE}"
    
    @description = <<-EOS
# #{@proj_name}

Describe the project here!

## Usage

### Instalation

### Documentation

### Examples

## License
Copyright (c) 2012 RimbaudCode
Licensed under GPLv3+. No warranty provided.
    EOS
    
  end
  
  def write_header
    File.open @readme_path, 'w' do |file| 
      file.write "#{@proj_name}\n"
      file.write "#{deco_str}\n"
      file.write "\n"
    end
  end
    
  def write_description
    File.open @readme_path, 'a' do |file| 
      file.puts "#{@description}\n"
    end
  end
  
  private
  def deco_str
    str = ''
    @proj_name.length.times do str << '=' end
    str
  end
    
end


class FileManager < Object
  
  require 'FileUtils'
    
  def initialize proj_name
    @proj_name      = proj_name
    @proj_basedir   = File.absolute_path @proj_name
    @launch_path    = FileUtils.pwd
    @tool_path      = File.dirname(File.absolute_path $0)
    @template_path  = File.join(@tool_path, TEMPLATE_PATH)
    
    @new_locations = {
      main: "lib/#{@proj_name}.rb", 
      exceptions: "lib/#{@proj_name}/exceptions.rb", 
      version: "lib/#{@proj_name}/version.rb",
      test_unit_extensions: "test/test_unit_extensions.rb",
      test_main: "test/test_#{@proj_name}.rb"
      }
  end
  
  def cp_files
    [:main, :exceptions, :version, :test_unit_extensions,
      :test_main].each do |file|  
        org_path = File.join @template_path, TEMPLATE_FILE_PATHS[file]
        new_path = File.join @proj_basedir, @new_locations[file]
        FileUtils.cp org_path, new_path        
    end
  end
    
end


if $0 == __FILE__
  begin
    $LOAD_PATH << File.expand_path(File.dirname(__FILE__) << '/../lib')
    
    def usage
      puts 'Create the bare bones of a macruby project'
      puts "usage: #{File.basename $0, '.rb'} <proj_name>"
      exit 0
    end

    usage if $*.empty?

    proj_name = $*.shift

    builder = DirBuilder.new proj_name
    builder.mkdir_tree

    readme_writer = ReadMeWriter.new proj_name
    readme_writer.write_header
    readme_writer.write_description

    manager = FileManager.new proj_name
    manager.cp_files
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
