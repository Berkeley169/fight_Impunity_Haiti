Feature: basic document flow should work
	
	As a site user
	So that I may populate the e-library
	I want to be able to create documents and have them published

Background:
	Given I am on the home page
	When I click English

Scenario: allow editor to create document and send it to new
	When I click English
	Given that I am signed in as an editor
	And  then there is a picture named "foobar"
	And I am on the new documents page
	Then I should see "foobar"

Scenario: allow manager to create document and send it to new
	Given that I am signed in as an manager 
	And  then there is a picture named "foobar"
	And I am on the new documents page
	Then I should see "foobar"

Scenario: allow manager to submit document from new to published
	Given that I am signed in as a manager
	And  then there is a picture named "foobar"
	When  I set the status of the english translation of the picture "foobar" to "published"
	And I am on the published documents path
	Then I should see "foobar"

Scenario: disallow editor from seeing the publish button
	Given that I am signed in as an editor
	And  then there is a picture named "foobar"
	When  I am on the edit picture page for "foobar"
	Then  I should not see "status"
