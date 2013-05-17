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

# this file contains the ruby-gnuplot info
GNUPLOT_RUBY = 'sine.rb'

# define filenames based on input file: GNUPLOT_RUBY
GNUPLOT_TEX = File.basename(GNUPLOT_RUBY, '.rb')
WRAPPER_TEX = 'plot-wrapper.tex'
WRAPPER_PDF = File.basename(WRAPPER_TEX, 'tex') << 'pdf'
PDF_OUTPUT  = File.basename(GNUPLOT_RUBY, 'rb') << 'pdf'

PDFLATEX_PATH = `which pdflatex`.chomp

# instructions to build the necessary files
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

file WRAPPER_PDF => WRAPPER_TEX do 
  `#{PDFLATEX_PATH} #{WRAPPER_TEX}` 
end

# tasks
DEFAULT_TASKS = [:build_gnuplot_tex, 
  :build_wrapper_tex,
  :build_wrapper_pdf
  #:rename_pdf,
  #:clean,
  #:open_pdf
  ]

desc 'get a pdf file from ruby-gnuplot data'
task :default => DEFAULT_TASKS

desc 'build a raw latex picture (plot) using ruby-gnuplot data'
task :build_gnuplot_tex => GNUPLOT_TEX

desc 'wrap the raw latex picture with a compiling latex file'
task :build_wrapper_tex => WRAPPER_TEX

desc 'compile latex wrapper to pdf'
task :build_wrapper_pdf => WRAPPER_PDF

desc 'rename pdf output with input file name'
task :rename_pdf do
  filename = File.basename(TMP_LATEX_FILE, 'tex') << 'pdf'
  `mv #{filename} #{PDF_OUTPUT}`
end

desc 'open pdf output'
task :open_pdf do
  `open #{PDF_OUTPUT}`
end


desc 'clean latex auxiliary files'
task :clean do
  `rm *.tex *.aux *.log`
end

desc 'clean latex auxiliary files and pdfs'
task :cleanall => :clean do
  `rm *.pdf`
end
