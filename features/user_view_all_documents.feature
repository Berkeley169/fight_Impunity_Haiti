Feature: View all documents as user
 
  As a Manager or Editor
  So that I may find a document
  I want to be able to see all of the documents

Scenario: disallow public from viewing all documents as user
  Given I am not signed in
  When  I go to the all documents page
  Then  I should be on the login page

Scenario: allow manager or editor to view all documents as user
  Given I am signed in
  When  I go to the all documents page
  Then  I should see all documents