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

Scenario: manager creates new user
  Given I am signed in as a manager
  When I go to the user create page
  And I fill in and submit the new user form with proper fields
  Then I should be on the user index page
  And I should see a user created message

Scenario: manager creates new user incorrectly
  Given I am signed in as a manager
  When I go to the user create page
  And I fill in and submit the new user form with improper fields
  Then I should be on the user create page
  And I should see an error message

Scenario: manager deletes an existing user
  Given I am signed in as a manager
  When I go to the user create page
  And I fill in and submit the new user form with proper fields
  Then I should be on the user index page
  When I press the last "Delete" button
  Then I should be on the user index page
  And I should see a user deleted message

Scenario: manager edit an existing user
  Given I am signed in as a manager
  When I am on the user index page
  And I should not see "Johnny Jonbo"
  When I follow "Edit"
  And I change "edit_user_first_name" to "Johnny Jonbo"
  And press "Save Changes"
  Then I should be on the user index page
  And I should see "Johnny Jonbo"

Scenario: manager deletes an existing user
  Given I am signed in as a manager
  And I am on the user index page
  When I press the first "Delete" button
  Then I should be on the user index page
  And I should see "A user cannot delete themselves"
