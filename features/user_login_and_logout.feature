Feature: Login as a user
 
  As an account holder
  So that I can manage and edit documents
  I want to be able to login with secure credentials

Scenario: allow users to login
  Given I am not signed in
  When  I go to the login page 
  And   I log in as "manager@gmail.com"
  Then  I should be on the dashboard page

Scenario: allows users to logout
  Given I am signed in
  When  I go to the logout page
  Then  I should be on the home page
  And   I should be signed out
