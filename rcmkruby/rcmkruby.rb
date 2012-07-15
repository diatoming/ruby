#!/usr/local/bin/macruby -w
# Have faith in the way things are.

class DirBuilder < Object
  
  require 'FileUtils'
  
  DIR_TREE = %w(bin doc lib test)
  
  def initialize proj_name
    @proj_name = proj_name
    @root_dir  = @proj_name
    @main_dir  = @proj_name
  end
  
  def mkdir_tree
    FileUtils.mkdir "#{@root_dir}"
    DIR_TREE.each do |dir| FileUtils.mkdir "#{@root_dir}/#{dir}" end
    FileUtils.mkdir "#{@root_dir}/lib/#{@proj_name}"
  end
    
end


class ReadMeWriter < Object
  
  README = 'README.md'
  DESCRIPTION = 'Describe the project here!'
  
  def initialize proj_name
    @proj_name    = proj_name
    @readme_path  = "#{@proj_name}/#{README}"
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
      file.puts "#{DESCRIPTION}\n"
    end
  end
  
  private
  def deco_str
    str = ''
    @proj_name.length.times do str << '=' end
    str
  end
    
end


class TemplatePlacer < Object
  
  require 'FileUtils'
  
  TEMPLATE_PATH = 'templates'
  
  ORG_LOCATIONS = {
    main: "main.rb", 
    exceptions: "exceptions.rb", 
    version: "version.rb",
    test_unit_extensions: "test_unit_extensions.rb",
    test_main: "test_main.rb"
  }
  
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
        org_path = File.join @template_path, ORG_LOCATIONS[file]
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

    placer = TemplatePlacer.new proj_name
    placer.cp_files
  rescue
    $stderr.puts "#{$!}"
    $@.each do |item| $stderr.puts item end
    exit 1
  ensure
    #
  end
end
