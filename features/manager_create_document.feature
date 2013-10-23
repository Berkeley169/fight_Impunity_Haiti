Feature: Submit new document as manager
 
  As an manager
  So that I can add to the eLibrary collection
  I want to be able to submit and publish documents

Scenario: allow manager to see the create document page
  Given I am signed in as an manager
  And   I am on the dashboard page
  When  I click on the create document link
  Then  I should be on the create document page

Scenario: publish a valid document as a manager
  Given I am signed in as an manager
  When  I publish a valid document
  Then  I should see the document in the published documents pool