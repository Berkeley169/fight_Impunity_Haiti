require 'spec_helper'

describe Dashboard::UsersController do
  
  describe "routing for a manager\n" do
    
    before(:each) do   
      user = FactoryGirl.build(:manager)
      Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
      User.stub(:find){user}
      User.stub(:find_by_id){user}
    end
    
    it "index page request returns http success" do
      get :index
      response.should be_success
    end
    it "new user page request returns http success" do
      get :new
      response.should be_success
    end
    it "edit user page request returns http success" do
      post :edit, id: 0
      response.should be_success
    end
    it "destroy user request redirects to index" do
      delete :destroy, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "update user page request redirects to index" do
      post :update, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "create user page request redirects to index" do
      get :create
      response.should redirect_to new_dashboard_user_path
    end
  end

  describe "routing for tech\n" do

    before(:each) do   
      user = FactoryGirl.build(:tech)
      Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
      User.stub(:find){user}
      User.stub(:find_by_id){user}
    end
    
    it "index page request returns http success" do
      get :index
      response.should be_success
    end
    it "new user page request returns http success" do
      get :new
      response.should be_success
    end
    it "edit user page request returns http success" do
      post :edit, id: 0
      response.should be_success
    end
    it "destroy user request redirects to index" do
      delete :destroy, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "update user page request redirects to index" do
      post :update, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "create user page request redirects to index" do
      get :create
      response.should redirect_to new_dashboard_user_path
    end
  end

  
  describe 'other user behavior\n' do

    it 'should redirect an editor to the dashboard' do
      user = FactoryGirl.build(:editor)
      Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
      get :index
      response.should redirect_to dashboard_path
    end
    it 'should redirect to login without authenticated user' do
       Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return("redirect")
      get :index
      response.should redirect_to sessions_login_path
    end
        
  end
end
