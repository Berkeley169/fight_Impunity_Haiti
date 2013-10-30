Feature: you should be able to select a language
	
	As a user
	I want to be able to change the language
	So I can read the site in my language

Scenario: Home page in Spanish
	Given I am on the home page
	When I click Spanish
	Then I should see "iniciar la sesión"

Scenario: Home page in French
	Given I am on the home page
	When I click French
	Then I should see "Identifiez-vous"

Scenario: Home page in Creole
	Given I am on the home page
	When I click Creole
	Then I should see "Identifiez-vous"

Scenario: Home page in English
	Given I am on the home page
	When I click English
	Then I should see "Login"

Scenario: When I visit the page again I should still see it in Spanish
	Given I am on the home page
	When I click Spanish
	Then I should see "iniciar la sesión"
	Given I am on the home page
	Then I should see "iniciar la sesión"

Scenario: When I visit the page again I should still see it in English
	Given I am on the home page
	When I click English
	Then I should see "Login"
	Given I am on the home page
	Then I should see "Login"

Scenario: When I visit the page again I should still see it in French
	Given I am on the home page
	When I click French
	Then I should see "Identifiez-vous"
	Given I am on the home page
	Then I should see "Identifiez-vous"

Scenario: When I visit the page again I should still see it in Creole
	Given I am on the home page
	When I click Creole
	Then I should see "Identifiez-vous"
	Given I am on the home page
	Then I should see "Identifiez-vous"