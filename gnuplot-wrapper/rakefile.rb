#!/usr/local/bin/ruby
#--
# Have faith in the way things are.
#
# rakefile.rb
# current v.: 0.0.1
# date: 2013.04.14
#++

# == Description
# production of pdfs out of gnuplots 
#
# == Usage
# rakefile.rb
#
# == Example
#  rake -T # for tasks
# 
# == Author
# rimbaud1854
#
# == Copyright
# Copyright (c) 2012 rimbaudcode
# Licensed under GPLv3+. No warranty provided.

require 'rake/clean'

# this file contains the ruby-gnuplot info
GNUPLOT_RUBY = 'sine.rb'

# pre-requisite tools
GNUPLOT_PATH  = `which gnuplot`.chomp
PDFLATEX_PATH = `which pdflatex`.chomp

# define filenames based on input file: GNUPLOT_RUBY
GNUPLOT_TEX = File.basename(GNUPLOT_RUBY, '.rb')
WRAPPER_TEX = 'plot-wrapper.tex'
WRAPPER_PDF = File.basename(WRAPPER_TEX, 'tex') << 'pdf'
OUTPUT_PDF  = File.basename(GNUPLOT_RUBY, 'rb') << 'pdf'

# tasks
DEFAULT_TASKS = [
  :sanity_checks,
  :build_gnuplot_tex, 
  :build_wrapper_tex,
  :build_wrapper_pdf,
  :wrapper_to_final_pdf,
  :clean,
  ]

desc 'get a pdf file from ruby-gnuplot data'
task :default => DEFAULT_TASKS

desc 'check if the environment is correctly set'
task :sanity_checks do
  FileDoesNotExistError   = Class.new StandardError
  NoGNUPlotInstalledError = Class.new StandardError
  NoTeXDistributionError  = Class.new StandardError
  begin
    raise FileDoesNotExistError unless File.file? GNUPLOT_RUBY
  rescue
    puts "File: #{GNUPLOT_RUBY} doesn't exist."
    exit 1
  end
  begin
    raise NoGNUPlotInstalledError if GNUPLOT_PATH.empty?
  rescue
    puts "GNUPlot not found. Install GNUPlot."
    exit 1
  end
  begin
    raise NoTeXDistributionError if PDFLATEX_PATH.empty?
  rescue
    puts "No TeX distribution found. Install TeX."
    exit 1
  end
end

desc 'build a raw latex picture (plot) using ruby-gnuplot data'
task :build_gnuplot_tex => GNUPLOT_TEX

desc 'wrap the raw latex picture with a compiling latex file'
task :build_wrapper_tex => WRAPPER_TEX

desc 'compile latex wrapper to pdf'
task :build_wrapper_pdf => WRAPPER_PDF

desc 'rename latex wrapper to output pdf'
task :wrapper_to_final_pdf => OUTPUT_PDF

desc 'open output pdf'
task :open_pdf do
  `open #{OUTPUT_PDF}`
end

# maintenance tasks
CLEAN.include('*.tex', '*.aux', '*.log')
CLOBBER.include('*.pdf')

# produce raw graphic using gnuplot
file GNUPLOT_TEX => GNUPLOT_RUBY do
  `ruby #{GNUPLOT_RUBY}`
end

# wrap the raw graph into a latex file that can be compiled
file WRAPPER_TEX => GNUPLOT_TEX do
  filename = WRAPPER_TEX
  `touch #{filename}`
  File.open filename, 'w' do |tmp| 
  	tmp.puts <<-EOF
    \\documentclass[11pt]{amsart}%
    \\usepackage{geometry}%
    \\geometry{a4paper}%
    \\geometry{landscape}%
    \\usepackage{graphicx}%
    \\begin{document}
    	\\include{#{GNUPLOT_TEX}}
    \\end{document}
    EOF
  end
end

# build the pdf file from the wrapper
file WRAPPER_PDF => WRAPPER_TEX do 
  `#{PDFLATEX_PATH} #{WRAPPER_TEX}` 
end

file OUTPUT_PDF => WRAPPER_PDF do 
  mv WRAPPER_PDF, OUTPUT_PDF
end
