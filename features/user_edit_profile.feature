Feature: User Edit Profile

As a user
I want to be able to update my profile
In case I make an error, or want to change my password

Scenario: User should be able to change name
	Given that I am signed in as an editor
	When I am on the dashboard page
	And I should not see "Johnny Jonbo"
	When I follow "Edit Profile"
	And I change "edit_user_first_name" to "Johnny Jonbo"
	And press "Save Changes"
  	Then I should be on the dashboard page
  	And I should see "Johnny Jonbo"

Scenario: User should be able to change password
	Given that I am signed in as an editor
	When I am on the dashboard page
	And I follow "Edit Profile"
	When I follow "Change Password"
	And I fill in "edit_user_password" with "password"
	And I fill in "edit_user_password_confirmation" with "password"
	And I press "Change my password"
	Then I should be on the dashboard page
	And I should see "password successfully updated"
	When I follow "Sign out"
	Then I should be on the home page
	When I follow "Login"
	And I try to log in as an editor
	Then I should be on the login page

Scenario: User should be able to change password
	Given that I am signed in as an editor
	When I am on the dashboard page
	And I follow "Edit Profile"
	When I follow "Change Password"
	And I fill in "edit_user_password" with "password"
	And I fill in "edit_user_password_confirmation" with "something else"
	And I press "Change my password"
	Then I should see "passwords don't match"