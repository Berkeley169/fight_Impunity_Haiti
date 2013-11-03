Feature: User Recover Password

As a user
I want to be able to retrieve my password
So I can still log on if I forget it

Scenario: User should be able to recover password
	Given I am not signed in
	And I am on the login page
	And I press "Forgot your password?"
	Then I should be on the password recovery page
	When I fill in "Email:" with "myemail@domain.com"
	And press "Submit"
	Then I should be on the login page
	And I should see "an email has been sent to myemail@domain.com"