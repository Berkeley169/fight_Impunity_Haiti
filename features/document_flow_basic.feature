Feature: basic document flow should work
	
	As a site user
	So that I may populate the e-library
	I want to be able to create documents and have them published

Scenario: allow editor to create document and send it to new
	Given that I am signed in as an editor
	When  I create a new document
	Then  I should see the document in new pool

Scenario: allow manager to create document and send it to new
	Given that I am signed in as an manager 
	When  I create a new document
	Then  I should see the document in new pool

Scenario: allow user to create document and send it to new 
	Given I am not signed in
	When  I create a new document
	Then  a manager should see the document in new pool

Scenario: allow manager to submit document from new to published
	Given that I am signed in as a manager
	And   there is a document in the new pool
	When  I publish the document
	Then  I should be on the new pool page
	And   I should see "document published"
	And   I should see the document in published pool
	And   public users should be able to see the document

Scenario: disallow editor from seeing the publish button
	Given that I am signed in as an editor
	And   there is a document in the new pool
	When  I am on the editing page for that document
	Then  I should not see a publish button
