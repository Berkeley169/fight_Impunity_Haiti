Feature: Publish document as manager
 
  As an manager
  So that I may allow a document to be seen by the public
  I want to be able to publish documents

Scenario: allow manager to publish an edited document
  Given I am signed in as a manager
  When  I go to the edit document page
  Then  I should be able to publish it

Scenario: disallow editor from publshing an edited document
  Given I am signed in as an editor
  When  I go to the edit document page
  Then  I should not be able to publish it