Feature: add non-public editor notes to a sound

  As an editor
  I want to have a "Notes" field of the sound I am editting
  So that I can take personal note of needed information, and share it with other editors/managers


Background: sound in database
  Given I am on the home page
  When I click English
  Given there is a sound named "TestSound"

Scenario: make sure the field is present
  Given I am signed in as an editor
  When  I go to the edit sound page for "TestSound"
  Then  I should see "Notes"

Scenario: allow editor to edit the notes section
  Given I am signed in as an editor
  When  I go to the edit sound page for "TestSound"
  And   I fill in "Notes" with "This is a test note."
  And   I press "Save"
  Then  I should see "This is a test note."

Scenario: disallow public users from seeing the notes
  Given I am not signed in
  And I go to the show sound page for "TestSound"
  Then I should not see "Notes"
