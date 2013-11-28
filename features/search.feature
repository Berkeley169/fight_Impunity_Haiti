Feature: search basics

  As a user
  I want to be able to search
  So I can find documents easier


Background: Document and Tag exist
  Given there is a text named "Test Text"
  Given there is a tag with En: "EnTag" Fr: "FrTag" Cr: "CrTag" Sp: "SpTag"

Scenario: make sure you can search
  Given I am on the home page
  Then  I should see "Search"

Scenario: search should return a document
  Given I am signed in as a manager
  When I search "Test Text"
  Then I should see "Test Text"

Scenario: search should return a tag
  Given I am signed in as a manager
  When I search "EnTag"
  Then I should see "EnTag"
