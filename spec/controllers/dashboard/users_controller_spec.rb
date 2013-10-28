require 'spec_helper'

describe Dashboard::UsersController do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:manager)
  end
  
  describe "routing for a manager\n" do
    
    #before(:each) do   
    #  user = FactoryGirl.build(:manager)
    #  Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
    #  User.stub(:find){user}
    #  User.stub(:find_by_id){user}
    #end
    it "index page request returns http success" do
      get :index
      response.should be_success
    end
    it "new user page request returns http success" do
      get :new
      response.should be_success
    end
    it "edit user page request returns http success" do
      get :edit, id: 1
      response.should be_success
    end
    it "destroy user request redirects to index" do
      delete :destroy, id: 1
      response.should redirect_to dashboard_users_path
    end
    it "update user page request redirects to index" do
      post :update, :id => 1, :edit_user => {:first_name => 'Jones'}
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
      sign_in user
    end
    
    it "index page request returns http success" do
      get :index
      response.should_not be_success
    end
    it "new user page request returns http success" do
      get :new
      response.should_not be_success
    end
    it "edit user page request returns http success" do
      get :edit, id: 1
      response.should_not be_success
    end
    it "destroy user request redirects to index" do
      delete :destroy, id: 0
      response.should_not redirect_to dashboard_users_path
    end
    it "update user page request redirects to index" do
      post :update, id: 0, :edit_user => {:first_name => 'Fred'}
      response.should_not redirect_to dashboard_users_path
    end
    it "create user page request redirects to index" do
      get :create
      response.should_not redirect_to new_dashboard_user_path
    end
  end

  
  describe 'other user behavior\n' do

    it 'should redirect an editor to the dashboard' do
      editor = FactoryGirl.create(:editor)
      editor.save
      sign_in editor
      get :index
      response.should redirect_to dashboard_path
    end
  end
end
