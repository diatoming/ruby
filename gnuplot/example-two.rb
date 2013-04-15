#!/usr/local/bin/ruby -w

ENV['RB_GNUPLOT'] = '/usr/local/bin/gnuplot'

require 'gnuplot'
require 'tmpdir'

pdfFile = 'dataset.pdf'

# work in tmp folder
currentDir = Dir.getwd
tmpdir = Dir.tmpdir
Dir.chdir tmpdir
texPlotFile = File.basename pdfFile, '.pdf'

# plot the graph
Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|
  
    plot.title  "Array Plot Example"
    plot.ylabel "x"
    plot.xlabel "x^2"
    
    x = (0..50).collect { |v| v.to_f }
    y = x.collect { |v| v ** 2 }

    plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
      ds.with = "linespoints"
      ds.notitle
    end
  end
end

# latex file holding the gnuplot
texSrcFile = 'tmp.tex'

srcCode = <<-EOF

% template.tex
% template for printing functions in latex
% Copyright 2012 RimbaudCode
% License: GPLv3+

\\documentclass[11pt]{amsart}%
\\usepackage{geometry}%
\\geometry{a4paper}%
\\geometry{landscape}%
\\usepackage{graphicx}%

\\begin{document}
	\\include{#{texPlotFile}}
\\end{document}

EOF

File.open texSrcFile, 'w' do |tmp| 
	tmp.puts srcCode
end

puts 'compiling latex source...'
`pdflatex -interaction=batchmode #{texSrcFile}`

# mv latex compiled pdf
outTexPdfFile = File.basename texSrcFile, '.tex'
outTexPdfFile = outTexPdfFile << '.pdf'

finalFile = File.join currentDir, pdfFile
File.rename outTexPdfFile, finalFile

# clean up
texTmpFiles = %w(*.tex *.aux *.log )
`rm *.tex *.aux *.log`
