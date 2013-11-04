Feature: User Edit Profile

As a user
I want to be able to update my profile
In case I make an error, or want to change my password

Scenario: User should be able to change name
	Given that I am signed in as an editor
	When I am on the home page
	And I should not see "Johnny Jonbo"
	When I follow "Edit Profile"
	Then I should be on the edit profile page
	When I change "edit_user_first_name" to "Johnny Jonbo"
	And press "Save Changes"
  	Then I should be on home page
  	And I should see "Johnny Jonbo"

Scenario: User should be able to change password
	Given that I am signed in as an editor
	When I am on the home page
	And I follow "Edit Profile"
	Then I should be on the edit profile page
	When I press "Edit Password"
	And I fill out the change password form
	And I press "Submit"
	Then I should be on the home page
	When I press "Sign out"
	Then I should be on the home page
	When I press "Login"
	And I try to log in as an editor
	Then I should be on the login page