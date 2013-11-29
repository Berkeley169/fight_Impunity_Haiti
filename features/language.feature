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
	Given I am on the create document page
	When I click English
	Then I should see "Please select a type of document to upload:"
	Then I should see "Text Document"
	When I follow "Text Document"
	Then I should see "Please select a document type from the list below"
	Then I should see "Journal Article"
	When I follow "Journal Article"
	Then I should see "New Text"
	Then I should see "Title"
	Then I should see "Back"
	When I fill in "text_text_langs_attributes_0_title" with "ASDF"
	When I press "Save"
	Then I should see "text was successfully created."

Scenario: When I am logging in with language set to English, I should see it in English
	Given I am on the login page
	When I click English
	Then I should see "Sign in"
	Then I should see "Forgot your password?"
