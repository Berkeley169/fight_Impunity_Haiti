Feature: Edit document as editor
 
  As an editor
  So that I can later submit them for manager approval
  I want to be able to edit documents

Background: 
  Given I am on the home page
  When I click English
  Given there is a text named "TestText"

Scenario: disallow public from editing documents
  Given I am not signed in
  When  I go to the edit text page for "TestText"
  Then  I should be on the login page

Scenario: allow editor to see the edit document page
  Given I am signed in as an editor
  When  I go to the edit text page for "TestText"
  Then  I should be on the edit text page for "TestText"
