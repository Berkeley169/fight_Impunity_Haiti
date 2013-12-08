Feature: support choosing what type of text to create

  As a manager
  I want uploaders to specify what type of text they are uploading
  So that the eLibrary's metadata can be more organized and complete

Scenario: user is prompted to pick a text type
  When I go to the new text page
  Then I should see "Please select a document type from the list below:"
  And I should see "Journal"
  And I should see "Newspaper"
  And I should see "Book"
  And I should see "Web"

Scenario: properly classify the documents
  Given I am signed in as an editor
  And I am on the new text page for text type "web"
  And I fill in "text_subtype_fields_website" with "CNN.com"
  And I press "Save"
  Then I should see "Website"
  And I should see "Url"
