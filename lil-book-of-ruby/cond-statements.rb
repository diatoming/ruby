#!/usr/local/bin/ruby -w

# if then else
p 'if then else'
a = 'b'
if a == 'b' then
  p 'a == b'
elsif a == 'c'
  p 'a == c'
else
  p 'a == d'
end

if a == 'b' then p 'a = b' end

# booleans
p 'booleans'
if a == 'b' or a == 'c' then p 'a == b or a == c' end
if a == 'b' and not a == 'c' then p 'a == b' end

a, b = 'c', 'd'
if a == 'c' and b == 'd' then p 'a == c and b == d' end

# one-liner
a = 'b'
p 'a == b' if a == 'b'

# unless
p 'unless'
unless a == 'b' then p 'a == b' end

p 'a == b' unless a == 'c'

# case
p 'case'
a = 'b'
case a
when 'b' then p 'a == b'
when 'c' then p 'a == c'
when 'd' then p 'a == d'
end
  

