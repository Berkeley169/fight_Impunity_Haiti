Feature: Tags showing on main page

Background: a tag exists
	Given there is a tag with En: "EnTag" Fr: "FrTag" Cr: "CrTag" Sp: "SpTag"
Scenario: simple tag on the home page
	Given I am on the home page
	When I click English
	Then I should see "EnTag"

Scenario: show the language you are using
	Given I am on the home page
	When I click French
	Then I should see "FrTag"

Scenario: show the language you are using
	Given I am on the home page
	When I click Spanish
	Then I should see "SpTag"

Scenario: show the language you are using
	Given I am on the home page
	When I click Creole
	Then I should see "CrTag"