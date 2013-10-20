Feature: Edit document as editor
 
  As an editor
  So that I may submit a document for approval by the manager
  I want to be able to edit documents

Scenario: disallow public from editing documents
  Given I am not signed in
  When  I go to edit a document
  Then  I should be on the login page

Scenario: allow editor to see the edit document page
  Given I am signed in as an editor
  When  I go to the edit document page
  Then  I should be able to edit the document

Scenario: allow editor to submit the document for manager approval
  Given I am signed in as an editor
  When  I submit a document an edited document
  Then  I should see the document on the something page