Given /I am a manager/ do
  manager = FactoryGirl.create(:manager, 
                               :email => 'manager@gmail.com', 
                               :password => 'password')
  visit '/login'
  post :login, {:email => 'manager@gmail.com', :password => 'password' }
end

Given /I am an editor/ do
  manager = FactoryGirl.create(:editor, 
                               :email => 'editor@gmail.com', 
                               :password => 'password')
  visit '/login'
  post :login, {:email => 'editor@gmail.com', :password => 'password' }
end