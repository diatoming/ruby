#!/usr/local/bin/ruby -w

# random int between 1 and 10 excluded
p rand(0...10)

# rand int between 1 and 10 included
p rand(0..10)

# extract rand int in given interval using '/dev/urandom' dir
# extract random bytes from '/dev/urandom' dir 
# use od to transform bytes to integers
# convert int to ruby_int via .to_i
# source:
# http://linux.byexamples.com/archives/128/generating-random-numbers/
def rand_int bytes, from_num, to_num
  (from_num + (`od -An -N#{bytes} -i /dev/urandom`.to_i) % \
    (to_num - from_num + 1))
end

p rand_int 2, 100, 1000


# rand float in given closed interval using ruby rand function
def rand_float from_num, to_num
  prng = Random.new 
  prng.rand(from_num..to_num)
end

p rand_float 1.0, 2.5

