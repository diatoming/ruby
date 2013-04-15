#!/usr/local/bin/ruby -w

r = (0..10).to_a

# each iterator (ruby way!)
p 'each'
r.each do |num| p num end

# for loop
p 'for'
for i in r do p i end

# while loop
p 'while'
i = 1
while i < 10
  p i
  i += 1
end

p 'another while'
i = 1
begin
  p i
  i += 1
end while i < 10

p 'yet another while'
i = 10
p 'test' while i = 10

# until
a = (0..10).to_a
until i == a.length 
  p a[i]
  i += 1
end
