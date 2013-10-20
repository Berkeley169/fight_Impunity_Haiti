Given /I am signed in/ do
  manager = FactoryGirl.create(:manager)
  visit '/sessions/login'
  post :login, { :email => manager.email, :password => manager.password }
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