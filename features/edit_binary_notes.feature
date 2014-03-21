Feature: add non-public editor notes to a document

  As an editor
  I want to have a "Notes" field of the binary I am editting
  So that I can take personal note of needed information, and share it with other editors/managers


Background: binary(s) in database
  Given I am on the home page
  When I click English
  Given there is a binary named "TestBinary"

Scenario: make sure the notes field is present
  Given I am signed in as an editor
  When  I go to the edit binary page for "TestBinary"
  Then  I should see "Notes"

Scenario: allow editor to edit the notes section
  Given I am signed in as an editor
  When  I go to the edit binary page for "TestBinary"
  And   I fill in "Notes" with "This is a test note."
  And   I press "Save"
  Then  I should see "This is a test note."

Scenario: disallow public users from seeing the notes
  Given I am not signed in
  And I go to the show binary page for "TestBinary"
  Then I should not see "Notes"
