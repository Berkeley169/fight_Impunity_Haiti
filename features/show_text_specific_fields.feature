Feature: Allow different types of text uploads to have specific fields

  As an uploader
  I want to be able to specify fields specific to certain document types
  So that I can more clearly distinguish between newspaper articles, journal entries, etc


# At the time of writing (11/1/2013), these tests do not reflect the 
# fields and text types that should be present.  The customer is yet
# to give us proper fields and upload types, so these are decent
# guestimates as to what types a user can be assumed to upload.
#
# TL;DR this set of tests may need to change as the upload requirements
# for different types of texts are solidified
Background:
  Given there is a web article text named "TextWebText"
  And there is a journal article text named "TestJournalText"
  And there is a book excerpt text named "TextBookText"
  And there is a newspaper article text named "TestNewsText"

Scenario: web articles show proper fields
  Given I am on the show page for "TextWebText"
  Then I should see "Website"
  And I should see "URL"
  And I should not see "Journal Name"
  And I should not see "Newspaper"
  And I should not see "Book Title"

Scenario: journal articles show proper fields
  Given I am on the show page for "TestJournalText"
  Then I should see "Journal Name"
  And I should not see "URL"
  And I should not see "Book Title"
  And I should not see "Newspaper"

Scenario: book excerpts show the proper fields
  Given I am on the show page for "TestBookText"
  Then I should see "Book Title"
  And I should not see "Website"
  And I should not see "Newspaper"
  And I should not see "Journal Name"
 
Scenario: newspaper articles show the proper fields
  Given I am on the show page for "TestNewsText"
  Then I should see "Newspaper"
  And I should not see "URL"
  And I should not see "Journal Name"
  And I should nto see "Book Title"
