Feature: add content to the 'about' and 'contact' pages
	
	As a public user
	I want to be able to see an "about" page and a "contact" page
	So I can learn about the cause of the project
	And I can get in touch with the leaders of the project

Background: you are on the home page
	Given I am on the home page
	Given I am not signed in

Scenario: see the about page
	Then I should see "About"
	When I follow "About"
	Then I should see "Fighting Impunity in Haiti"

Scenario: see the contact page
	Then I should see "Contact"
	When I follow "Contact"
	Then I should see "Contact Information"
	And I should see "Administrator"