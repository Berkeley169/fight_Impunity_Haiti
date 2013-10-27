# This top example is the most correct,
# and the steps here should be refined to
# have logins for editors, managers, and techs
Given /there is an (.*) with email "(.*)" and password "(.*)"/ do |role, email, password|
  user = FactoryGirl.create(role.to_sym, :email => email, :password => password)
  user.save
end

Given /I am signed in as an? (.*)$/ do |role|
  manager = FactoryGirl.create(role.to_sym)
  manager.save
  visit '/sessions/login'

  #fill_in "user_email", :with => manager.email
  #fill_in "user_password", :with => manager.password
  #click_button "Sign in"
  step "I log in with email \"#{manager.email}\" and password \"#{manager.password}\""
end

Given /I am not signed in/ do
  visit '/sessions/logout'
end

And /I log in with email "(.*)" and password "(.*)"$/ do |email, password|
  visit sessions_login_path

  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Then /I should be signed out/ do
  visit '/dashboard'
  step 'I should see "You must log in before continuing"'
end

Then /I should be signed in/ do
  if not user_signed_in?
    fail
  end
end
