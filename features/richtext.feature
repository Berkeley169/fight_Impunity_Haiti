Feature: add a rich text-editor to edit/manage content

  As an editor/manager
  I would like to make/add content in a rich text editor
  So that I can bold, italicize, format, and manage content dynamically within the textarea


Background: text in database
  Given I am on the home page
  When I click English
  Given there is a text named "TestText"

Scenario: make sure a textarea is present
  Given I am signed in as an editor
  When  I go to the edit text page for "TestText"
  Then the "textarea" tag with id "text_text_langs_attributes_0_plain_text" should be rendered

Scenario: allow editor to edit any textarea section
  Given I am signed in as an editor
  When  I go to the edit text page for "TestText"