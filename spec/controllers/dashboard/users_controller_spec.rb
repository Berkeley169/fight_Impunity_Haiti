require 'spec_helper'

describe Dashboard::UsersController do
  
  describe "routing\n" do

    before(:each) do   
      user = FactoryGirl.build(:manager)
      Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
      User.stub(:find){user}
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
    it "destroy user request returns http success" do
      delete :destroy, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "update user page request returns http success" do
      post :update, id: 0
      response.should redirect_to dashboard_users_path
    end
    it "create user page request returns http success" do
      get :create
      response.should redirect_to dashboard_users_path
    end
  end

  describe 'behavior\n' do

    it 'should redirect a non-manager to the dashboard' do
      user = FactoryGirl.build(:editor)
      Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
      get :index
      response.should redirect_to dashboard_path
    end
    
  end

end
