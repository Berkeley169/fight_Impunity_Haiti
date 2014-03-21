Feature: User Edit Profile

As a user
I want to be able to update my profile
In case I make an error, or want to change my password

Background:
	Given I am on the home page
	When I click English

Scenario: User should be able to change name
	Given I am on the home page
	When I click English
	Given that I am signed in as an editor
	When I am on the home page
	And I should not see "Johnny Jonbo"
	When I follow "Edit Profile"
	And I change "user_first_name" to "Johnny Jonbo"
	And press "Submit"
    And I should see "Johnny Jonbo"

Scenario: User should be able to change password
	Given there is an editor with email "editor@domain.com" and password "oldpassword"
	When I click English
    And I log in with email "editor@domain.com" and password "oldpassword"
	When I am on the home page
	And I follow "Edit Profile"
	And I fill in "user_password" with "newpassword"
	And I fill in "user_password_confirmation" with "newpassword"
	And I press "Submit"
	And I am not signed in
	When I click English
	And I log in with email "editor@domain.com" and password "newpassword"
	Then I should see "Logout"

Scenario: User should be able to change password
	Given I am on the home page
	When I click English
	Given that I am signed in as an editor
	And I follow "Edit Profile"
	And I fill in "user_password" with "password"
	And I fill in "user_password_confirmation" with "something else"
	And I press "Submit"
	Then I should see "error"
