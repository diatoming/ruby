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

INPUT_FILE    = 'sine.rb'

GNUPLOT_OUTPUT = File.basename(INPUT_FILE, '.rb')
PDF_OUTPUT     = File.basename(INPUT_FILE, '.rb') << '.pdf'
TMP_LATEX_FILE = 'tmp.tex'

DEFAULT_TASKS = [:build_latex_plot, 
  :wrap_gnuplot_latex, 
  :compile_wrapper_to_pdf, 
  :rename_pdf,
  :open_pdf,
  :clean
  ]

desc 'compile gnuplot output to pdf'
task :default => DEFAULT_TASKS

desc 'build latex plot using gnuplot data'
task :build_latex_plot do
  `ruby #{INPUT_FILE}`
end

desc 'wrap gnplot latex into a compling latex file'
task :wrap_gnuplot_latex do
  filename = TMP_LATEX_FILE
  `touch #{filename}`
  File.open filename, 'w' do |tmp| 
  	tmp.puts <<-EOF
    \\documentclass[11pt]{amsart}%
    \\usepackage{geometry}%
    \\geometry{a4paper}%
    \\geometry{landscape}%
    \\usepackage{graphicx}%
    \\begin{document}
    	\\include{#{GNUPLOT_OUTPUT}}
    \\end{document}
    EOF
  end
end

desc 'compile latex wrapper to pdf'
task :compile_wrapper_to_pdf do
  PDFLATEX_PATH = `which /usr/texbin/pdflatex`.chomp
  `#{PDFLATEX_PATH} #{TMP_LATEX_FILE}`
end

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
