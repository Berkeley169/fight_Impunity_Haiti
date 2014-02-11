Feature: basic routes should work
	
	This is just to learn how to use cucumber
	and also just make sure all of our basic
	pages are working

Background: you are on the home page
	Given I am on the home page

Scenario: see the home page
	When I click English
	Then I should see "Login"
