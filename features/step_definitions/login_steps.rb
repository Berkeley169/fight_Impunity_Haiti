# This top example is the most correct,
# and the steps here should be refined to
# have logins for editors, managers, and techs
Given /I am signed in as an? (.*)$/ do |role|
  manager = FactoryGirl.create(role.to_sym)
  manager.save
  visit '/sessions/login'

  fill_in "user_email", :with => manager.email
  fill_in "user_password", :with => manager.password
  click_button "Sign in"
end

Given /I am not signed in/ do
  visit '/sessions/logout'
end

And /I log in as (.*)/ do |email|
  manager = FactoryGirl.create(:manager)
  post :login, { :email => manager.email, :password => manager.password }
end

Then /I should be signed out/ do
  visit '/dashboard'
  step %Q{I should be on the login page}
end

Then /I should be signed in/ do
  if not user_signed_in?
    fail
  end
end
