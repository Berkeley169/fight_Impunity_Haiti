Feature: bug fix for tag views showing unpublished documents

  Bug Fix: No User Story Needed

Background: Generate some documents, which will all be 'new' by default
  
  Given there is a picture named "TestPic"
  And there is a text named "TestText"
  And there is a tag named "TestTag"
  And the picture named "TestPic" is assigned the tag named "TestTag"
  And the text named "TestText" is assigned the tag named "TestTag"

Scenario: test that the picture cannot be seen
  Given I am not signed in
  And I am on the tag index page for "TestTag"
  Then I should not see "TestPic"

Scenario: test that the text cannot be seen
  Given I am not signed in
  And I am on the tag index page for "TestTag"
  Then I should not see "TestText"
