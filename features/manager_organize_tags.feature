Feature: Manage tags and categorization

As a manager
I want to be able to add new tags
So that editors and uploaders can better categorize their content

Scenario: allow manager to view the tag page
  Given I am signed in as a manager
  When  I go to the manage tags page
  Then  I should be on the manage tags page

Scenario: disallow editor from viewing the tag page
  Given I am signed in as an editor
  When  I go to the manage tags page
  Then  I should be on the dashboard page

Scenario: allow manager to edit a tag for a document
  Given I am signed in as a manager
  When  I go to the edit document page
  Then  I should see the document's tags
  And   I should be able to edit them and save them

Scenario: disallow editor from editing a tag for a document
  Given I am signed in as an editor
  When  I go to the edit document page
  Then  I should see the document's tags
  And   I should not be able to edit them