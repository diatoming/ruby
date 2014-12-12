require '././bin/robot'

Given(/^Robot created$/) do
  @robot = Robot.new
  # pending # express the regexp above with the code you wish you had
end

When(/^I check the position$/) do
  @position = @robot.position
  # pending # express the regexp above with the code you wish you had
end

Then(/^Robot should be at (\d+)$/) do |arg1|
  @position.should == arg1.to_i
  # pending # express the regexp above with the code you wish you had
end

Given(/^Robot is at (\d+)$/) do |arg1|
  @robot = Robot.new
  # pending # express the regexp above with the code you wish you had
end

When(/^I enter 'F', (\d+)$/) do |arg1|
        @robot.move('F', arg1.to_i)
  # pending # express the regexp above with the code you wish you had
end
