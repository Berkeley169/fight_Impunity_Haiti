Feature: grant proper document editting permissions to editors

  As a Manager
  I want editors to only be able to edit "in_progress" documents
  So that only managers can change documents once they are published

Background:
  Given I am on the home page
  When I click English
  Given there is a picture named "TestPic1"
  And there is a picture named "TestPic2"
  And there is a newspaper article text named "TestNews"
  And I set the status of the English translation of the picture "TestPic1" to "published"
  And I set the status of the French translation of the picture "TestPic1" to "in_progress"
  And I set the status of the English translation of the picture "TestPic2" to "pending"
  And I set the status of the Creole translation of the text "TestNews" to "published"
  And I set the status of the Spanish translation of the text "TestNews" to "in_progress"
  And I am signed in as an editor

# numbers in IDs correspond as follows: {English => 1, French => 2, Creole => 3, Spanish => 4}

Scenario: No ability to edit published translations
  Given I am on the edit text page for "TestNews"
  Then I should not be able to fill in "document_lang_creole_description"

Scenario: Cannot edit pending translations
  Given I am on the edit picture page for "TestPic2"
  Then I should not be able to fill in "picture_lang_english_description"
