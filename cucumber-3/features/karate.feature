Feature: Traditional karate

Scenario: where is the master?
	Given I navigate to google
	When I enter Wado into the searching field
	Then the text Ohtsuka should be present
