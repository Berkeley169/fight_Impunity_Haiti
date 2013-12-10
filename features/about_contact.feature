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
	Then I should see "Contact"
	And I should see "Reason"
 
Scenario: submit a request to be contacted
  When I follow "Contact"
  And I fill in "Name" with "test_name"
  And I fill in "Email" with "pie@b.c"
  And I select "Question" from "option"
  And I fill in "Reason" with "this is a test"
  And I press "Submit"
  Then I should see "Thank you for your input."

