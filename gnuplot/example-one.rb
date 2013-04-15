#!/usr/local/bin/ruby -w

ENV['RB_GNUPLOT'] = '/usr/local/bin/gnuplot'

require 'gnuplot'
require 'tmpdir'

pdfFile = 'sine.pdf'

# work in tmp folder
currentDir = Dir.getwd
tmpdir = Dir.tmpdir
Dir.chdir tmpdir
texPlotFile = File.basename pdfFile, '.pdf'

# plot the graph
Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|

    # A4: 29.71 × 21.01 cm
    plot.terminal 'latex size 21.71cm, 13.01cm'
    plot.output "#{texPlotFile}.tex"
    # to use latex math!
    plot.format 'xy "$%g$"'
    plot.key 'bottom right'
    plot.grid
    
    plot.title  "Sine function"
    plot.xlabel 'sin$(x)$ [1]'
    plot.ylabel '$x$ [rad]'
    plot.xrange '[0:3*pi]'
    plot.yrange '[-1:1]'
    
    plot.data << Gnuplot::DataSet.new( 'sin(x)' ) do |ds|
      ds.with = 'lines linetype 3 linecolor rgbcolor "black"'
      ds.linewidth = 1
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
