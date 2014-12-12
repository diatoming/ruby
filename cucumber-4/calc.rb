
# other ways to catch the first element of the ARGV array
#print eval(ARGV[0])
#print eval($*[0])

# nice way of catching the first element of ARGV
arg = ARGV.shift
print eval(arg)
