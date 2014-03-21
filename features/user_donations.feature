Feature: users of the site can make donations

  As a site visitor
  I want to be able to make a donation to the organization
  So I can perpetuate the work they're doing, which I support

Background:
	Given I am on the home page
	When I click English

Scenario: There is a Donations button on the navbar
  Given I am on the home page
  Then I should see "Donate"

Scenario: donations work
  Given I am on the donate page
  Then there should a donate form
