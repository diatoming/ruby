Given(/^I navigate to google$/) do
  #@browser = Watir::Browser.new :firefox     # in hooks.rb
  @browser.goto "https://www.google.com/ncr"
end

When(/^I enter Wado into the searching field$/) do
  search_field = @browser.text_field(:name, 'q')
  search_button = @browser.button(:name, 'btnG')
  search_field.set 'Wado'
  search_button.click
end

Then(/^the text Ohtsuka should be present$/) do
  @browser.div(:id => 'resultStats').wait_until_present
  #(@browser.text.include? 'Ohtsuka').should == true
  #@browser.close                                         # in hooks.rb
end
