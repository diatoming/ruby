Feature: Robot in Motion
  In order to move my robot
  As an owner
  I want the ability to create and move based on instructions
  Scenario: Create a robot
    Given Robot created
    When I check the position
    Then Robot should be at 0
  Scenario: Move forward
    Given Robot is at 0
    When I enter 'F', 10
    And I check the position
    Then Robot should be at 10
