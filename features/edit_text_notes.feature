Feature: add non-public editor notes to a document

  As an editor
  I want to have a "Notes" field of the text I am editting
  So that I can take personal note of needed information, and share it with other editors/managers


Background: text in database
  Given I am on the home page
  When I click English
  Given there is a text named "TestText"

Scenario: make sure the field is present
  Given I am signed in as an editor
  When  I go to the edit text page for "TestText"
  Then  I should see "Notes"

Scenario: allow editor to edit the notes section
  Given I am signed in as an editor
  When  I go to the edit text page for "TestText"
  And   I fill in "Notes" with "This is a test note."
  And   I press "Save"
  Then  I should see "This is a test note."

Scenario: disallow public users from seeing the notes
  Given I am not signed in
  And I go to the show text page for "TestText"
  Then I should not see "Notes"
