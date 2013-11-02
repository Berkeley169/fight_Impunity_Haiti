Feature: support choosing what type of text to create

  As a manager
  I want uploaders to specify what type of text they are uploading
  So that the eLibrary's metadata can be more organized and complete

Scenario: user is prompted to pick a text type
  When I go to the new text page
  Then I should see "Please specify the type of document being uploaded"
  And I should see "Journal"
  And I should see "Newspaper"
  And I should see "Book"
  And I should see "Web"

Scenario: properly classify the documents
  Given I am on the new text page
  And I fill in "Name" with "TestWebText"
  And I fill in "Date" with "2009-11-01"
  And I fill in "Author" with "Jim Jones McGee"
  And I press "Submit"
  Then text "TestWebText" should be of type "web"
