Feature: editting texts prompts for the right subtype fields

  As an editor/manager
  I want text edit forms to show the right fields
  So I can insert/change the proper attributes about a document

Background:
  Given there is a web article text named "TestWebText"
  And there is a newspaper article text named "TestNewsText"
  And there is a journal article text named "TestJournalText"
  And there is a book excerpt text named "TestBookText"
  And I am signed in as an editor

Scenario:
  When I go to the edit text page for "TestWebText"
  Then I should see "Url"
  And I should not see "Newspaper"

Scenario:
  When I go to the edit text page for "TestNewsText"
  Then I should see "Newspaper"
  And I should not see "Journal Name"

Scenario:
  When I go to the edit text page for "TestJournalText"
  Then I should see "Journal"
  And I should not see "Url"

Scenario:
  When I go to the edit text page for "TestBookText"
  Then I should see "Title"
  And I should not see "Newspaper"
