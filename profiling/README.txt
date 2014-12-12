# graph tool
$ brew install graphviz

# ruby-prof gem
$ sudo gem install ruby-prof

# profile and print the data out as pdf
$ ruby-prof --mode=wall --printer=dot --file=output.dot fibonacci.rb 25
$ dot -T pdf -o output.pdf output.dot
$ open output.pdf
