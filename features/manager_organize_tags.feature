Feature: Manage tags and categorization

  As a manager
  I want to be able to add new tags
  So that editors and uploaders can better categorize their content

Background:
  Given there is a tag named "TestTag"

Scenario: allow manager to view the tag page
  Given I am signed in as a manager
  When  I go to the edit tag page for "TestTag"
  Then  I should be on the edit tag page for "TestTag"

Scenario: disallow editor from editing a tag
  Given I am signed in as an editor
  When  I go to the edit tag page for "TestTag"
  Then  I should be on the home page

