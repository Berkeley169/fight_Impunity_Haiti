Feature: add non-public editor notes to a picture

  As an editor
  I want to have a "Notes" field of the picture I am editting
  So that I can take personal note of needed information, and share it with other editors/managers


Background: picture(s) in database
  When I click English
  Given there is a picture named "TestPic"

Scenario: make sure the field is present
  Given I am signed in as an editor
  When  I go to the edit picture page for "TestPic"
  Then  I should see "Notes"

Scenario: allow editor to edit the notes section
  Given I am signed in as an editor
  When  I go to the edit picture page for "TestPic"
  And   I fill in "Notes" with "This is a test note."
  And   I press "Save"
  Then  I should see "This is a test note."

Scenario: disallow public users from seeing the notes
  Given I am not signed in
  And I go to the show picture page for "TestPic"
  Then I should not see "Notes"

