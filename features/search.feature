Feature: search basics

  As a user
  I want to be able to search
  So I can find documents easier


Background: Document and Tag exist
  Given I am on the home page
  When I click English
  Given I am signed in as a manager
  And I am on the home page
  Given there is a text named "TestText"
  Given there is a tag with En: "EnTag" Fr: "FrTag" Cr: "CrTag" Sp: "SpTag"

Scenario: make sure you can search
  Given I am on the home page
  Then  I should see the search button

Scenario: search should return a document
  When I search "TestText"
  Then I should see "TestText"

Scenario: search should return a tag
  When I search "EnTag"
  Then I should see "EnTag"
