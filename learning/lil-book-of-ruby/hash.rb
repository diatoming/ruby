#!/usr/local/bin/ruby -w

# works with ruby 1.9 or above
h = {one: 'number one', two: 'number two'}

# accessing a value given the key
p h[:one]
p h[:two]

# operations with hashes
h1 = h
h2 = {two: 'number two', three: 'number three', four: 'number four'}

# set intersection: keys
p h1.keys & h2.keys

# set intersection: values
p h1.values & h2.values

# concatenation
p h1.keys + h2.keys

# difference
p h1.values - h2.values

# append
p h1.keys << h2.keys

# append, un-nest and reverse
p (h1.keys << h2.keys).flatten.reverse

