Feature: Tags showing on main page
	As a public user
	When I am looking at a main category
	I want to see all the subcategories
	So I can easily navigate the site

Background: a tag exists
	Given there is a tag with En: "EnTag" Fr: "FrTag" Cr: "CrTag" Sp: "SpTag"
	And I am signed in as a manager
Scenario: simple tag on the home page
	Given I am on the home page
	When I click English
	Then I should see "EnTag"
	When I follow "EnTag" within "ul.dropdown-menu"
	Then I should see "EnTag"