Then /I fill in and submit the new user form with proper fields/ do
  fields = FactoryGirl.attributes_for(:editor)
  fill_in('new_user_email', :with => fields[:email])
  fill_in('new_user_password', :with => fields[:password])
  fill_in('new_user_password_confirmation', :with => fields[:password])
  fill_in('new_user_first_name', :with => fields[:first_name])
  fill_in('new_user_last_name', :with => fields[:last_name])
  choose("new_user_role_#{fields[:role].downcase}")
  choose("new_user_lang_#{fields[:lang].downcase}")
  click_button('Create New User')
end

Then /I fill in and submit the new user form with improper fields/ do
  fill_in('new_user_password', :with => 'one thing')
  fill_in('new_user_password_confirmation', :with => 'something else')
  click_button('Create New User')
end
  
Then /I should see a user created message/ do
  all("#flash").first.text.should include("was created")
end

Then /I should see an error message/ do
  all("#flash").first.text.should include("an error")
end

When /I fill out the change password form/ do
  fields = FactoryGirl.attributes_for(:editor)
  fill_in('current_password', :with => fields['password'])
  fill_in('new_password', :with => 'password')
  fill_in('confirm_new_password', :with => 'password')
end

When /I try to log in as an editor/ do
  fields = FactoryGirl.attributes_for(:editor) 
  fill_in('Email', :with => fields['email'])
  fill_in('Password', :with => fields['password'])
  click_button('Sign in')  
end

When /^I press the (.*) "(.*?)" button$/ do |which,button_type|
  eval "(all('a', :text => button_type).#{which}).click"
end

Then /^I should see a user deleted message$/ do
  all("#flash").first.text.should include("was deleted")
end

When /I change "(.*)" to "(.*)"/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end
