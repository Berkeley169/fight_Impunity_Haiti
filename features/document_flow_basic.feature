Feature: basic document flow should work
	
	As a site user
	So that I may populate the e-library
	I want to be able to create documents and have them published

Scenario: allow editor to create document and send it to new
	Given that I am signed in as an editor
	And  then there is a picture named "foobar"
	And I am on the new documents path
	Then I should see "foobar"

Scenario: allow manager to create document and send it to new
	Given that I am signed in as an manager 
	And  then there is a picture named "foobar"
	And I am on the new documents path
	Then I should see "foobar"

Scenario: allow manager to submit document from new to published
	Given that I am signed in as a manager
	And  then there is a picture named "foobar"
	When  I set the status of "English" translation of the "picture" "foobar" to "published"
	And I am on the published documents path
	Then I should see "foobar"

Scenario: disallow editor from seeing the publish button
	Given that I am signed in as an editor
	And   there is a document in the new pool
	When  I am on the editing page for that document
	Then  I should not see a publish button
