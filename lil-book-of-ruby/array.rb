#!/usr/bin/env ruby -wKU

a = [1, 2, 3, 4, 5]

# access array values
p a[0]
p a[1]

a.each do |num| p num end

# array of strings
s = %(this is a test)
for i in s do p i end

# indexing an array
a = ['h','e','l','l','o',' ','w','o','r','l','d']
p a[5..10]

# append
a = (0..10).to_a
b = (10..20).to_a
p a << b          # append changes the receiver!

# append and flatten (unnest)
c = a << b
p c.flatten

# + returns a new array
a = (0..10).to_a
b = (10..20).to_a

p a + b
p a

