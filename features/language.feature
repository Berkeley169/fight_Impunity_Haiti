Feature: you should be able to select a language
	
	As a user
	I want to be able to change the language
	So I can read the site in my language

Background: You choose Spanish
	Given I am on the home page
	Given my language is Spanish

Scenario: see the home page
	Then I should see "Login in Spanish"