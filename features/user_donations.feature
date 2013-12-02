Feature: users of the site can make donations

  As a site visitor
  I want to be able to make a donation to the organization
  So I can perpetuate the work they're doing, which I support

Scenario: There is a Donations button on the navbar
  Given I am on the home page
  Then I should see "Donate"

Scenario: donations work
  Given I am on the donate page
  And I fill in "Amount" with "100"
  And I supply my PayPal information
  And I press "Donate!"
  Then I should be on the home page
  And I should see "Thank you for your donation."
