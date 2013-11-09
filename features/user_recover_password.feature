Feature: User Recover Password

As a user
I want to be able to retrieve my password
So I can still log on if I forget it

Background: User tries to recover password
	Given I am signed in as a manager
	Then I am not signed in
	And I am on the login page
	And I follow "Forgot your password?"
	Then I should be on the password recovery page

Scenario: User should be able to recover password
	When I fill in "user_email" with "manager@gmail.com"
	And press "Send me reset password instructions"
	Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."

Scenario: User should be able to recover password
	When I fill in "user_email" with "dummy@domain.com"
	And press "Send me reset password instructions"
	Then I should be on the password page
	And I should see "Email not found"