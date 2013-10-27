Feature: Create new users as manager
 
  As a Manager
  So that we can have more editors and contributors
  I want to be able to make new user profiles

Scenario: disallow public from accessing user create page
  Given I am not signed in
  When  I go to the user create page
  Then  I should be on the login page

Scenario: disallow editors from accessing user create page
  Given I am signed in as an editor
  When  I go to the user create page
  Then  I should be on the dashboard page

Scenario: allow managers to access user create page
  Given I am signed in as a manager
  When  I go to the user create page
  Then  I should be on the user create page
