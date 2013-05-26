#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

str1 = "\u03B1\u0300" # \u03B1: letter (alpha); \u0300: accent
puts str1

str2 = "\u03B1\u0306" # \u03B1: letter (alpha); \u0306: vrachy
puts str2

str3 = "\u03B4\u0306" # \u03B4: letter (beta); \u0306: vrachy
puts str3

str4 = "\u{03B4 0306}" # the same as above! (note the space!)
puts str4

str5 = "\u{03b4 0306}" # the same as above! (note lowercase code!)
puts str5

fname = "test.txt"
File.open(fname, "w") do |f|
  f.puts str1
  f.puts str2
  f.puts str3
  f.puts str4
  f.puts str5
end
