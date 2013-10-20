Given /I am not signed in/ do
  visit '/sessions/logout'
end

Given /I am a manager/ do
  manager = FactoryGirl.create(:manager)
  visit '/login'
  post :login, {:email => manager.email, :password => manager.password }
end

Given /I am an editor/ do
  manager = FactoryGirl.create(:editor)
  visit '/login'
  post :login, {:email => editor.email, :password => editor.password }
end