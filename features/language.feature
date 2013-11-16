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

Scenario: When I visit the texts page and set language to English, I should see it in English
	Given I am on the texts page
	When I click English
	Then I should see "Listing Texts"
	Then I should see "Submit a Document"

Scenario: When I go through new document flow with language set to English, I should see it in English
	Given I am on the new documents page
	When I click English
	Then I should see "Please select a type of document to upload:"
	Then I should see "Text Document"
	When I click "Text Document"
	Then I should see "Please select a document from the list below"
	Then I should see "Web Journal"
	When I click "Web Journal"
	Then I should see "New Text"
	Then I should see "Title"
	Then I should see "Choose File"
	Then I should see "Size"
	Then I should see "Save"
	Then I should see "Back"
	When I fill "Name" field with "ASDF"
	When I click "Submit"
	Then I should see "text was successfully created."

Scenario: When I am logging in with language set to English, I should see it in English
	Given I am on the login page
	When I click English
	Then I should see "Sign in"
	Then I should see "Forgot your password?"
	When I click "Forgot your password?"
	I should see "Send me reset password instructions"
	