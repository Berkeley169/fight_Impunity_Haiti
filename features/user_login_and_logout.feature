Feature: Login as a user
 
  As an account holder
  So that I can manage and edit documents
  I want to be able to login with secure credentials

Background:
  Given there is an editor with email "bob@bomb.com" and password "hunter222"

Scenario: allow users to login
  Given I am not signed in
  When  I go to the login page 
  And   I log in with email "bob@bomb.com" and password "hunter222"
  Then  I should be on the home page

Scenario: allows users to logout
  Given I am signed in as an editor
  When  I go to the logout page
  Then  I should be on the home page
  And   I should be signed out

Scenario: logging in as a non-existent user causes failure
  Given I am not signed in
  When  I go to the login page
  And   I log in with email "roger@regret.net" and password "hunter2"
  Then  I should be on the login page

Scenario: an incorrect password causes failure
  Given I am not signed in
  When  I go to the login page
  And   I log in with email "bob@bomb.com" and password "hunter3"
  Then  I should be on the login page
