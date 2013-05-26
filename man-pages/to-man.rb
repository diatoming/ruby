#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

filename = 'ronn-format.7.ronn'
man_file = 'ronn-format.7'

File.open filename, 'w' do |f| 
  str = <<-EOS
## Section
  EOS
  f.print str
end

`/usr/local/Cellar/ruby/1.9.3-p194/bin/ronn -r #{filename} 2> err.log`
system("man ./#{man_file}")

`rm err.log #{filename} #{man_file}`
