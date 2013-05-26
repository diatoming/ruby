#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

require 'ostruct'

# structs in Ruby are like C structs: code that has instance vars but
# no methods.

# ostruct is a library that allows the creation of structs 'on-the-fly'

# struct cointaining a variable
icecream = OpenStruct.new
icecream.flavor = "strawberry"  # dot notation

p icecream
p icecream.flavor               # dot nontation

# struct containing an array
gelateria = OpenStruct.new
gelateria.flavors = ["strawberry", "apple", "chocolate", "mango"].sort
p gelateria
p gelateria.flavors
p gelateria.flavors[2]

# struct containing a dictionary
heladerias = OpenStruct.new
heladerias.sucursales = {cortina: ["strawberry", "apple", "chocolate"],
  corfu: ["mora", "chocolate", "vainilla"]}
p heladerias
p heladerias.sucursales[:corfu]
p heladerias.sucursales[:cortina][2]
