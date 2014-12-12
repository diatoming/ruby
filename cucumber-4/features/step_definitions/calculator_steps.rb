Given /^the input "([^"]*)"$/ do |input|
  @input = input
end

When /^the calculator is run$/ do
  @output = `ruby calc.rb #{@input}`
  raise('Command failed!') unless $?.success?
end

Then /^the output should be "([^"]*)"$/ do |expected_output|
  #@output.should == expected_output
  expect(@output).to eq(expected_output)
end

=begin

'should' synthax deprecated! use the 'expect' synthax instead!

# rather than:
foo.should == bar

# ...use:
expect(foo).to eq(bar)

=end
