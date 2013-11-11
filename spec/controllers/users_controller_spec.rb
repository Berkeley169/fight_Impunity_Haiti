require 'spec_helper'

describe UsersController do

  include Devise::TestHelpers
  
  describe 'should redirect non-manager' do

    it 'should allow an editor to view a list of accounts' do
      editor = FactoryGirl.create(:editor)
      editor.save
      sign_in editor
      get :index
      response.should be_success
    end

    it 'should redirect to login without authenticated user' do
      UsersController.any_instance.stub(:current_user).and_return(nil)
      get :index
      response.should redirect_to new_user_session_path
    end       
  end

  describe "Get create" do
    it "should redirect to the show page" do
      manager = FactoryGirl.create(:manager)
      manager.save
      sign_in manager
      post :create, :user => FactoryGirl.attributes_for(:manager, :email => "#{Time.now.to_f}@domain.com")
      response.status.should == 302
    end
  end

  describe "Get destroy" do
    it "should redirect" do
      t = FactoryGirl.create(:manager, :email => "#{Time.now.to_f}@domain.com")
      t.save
      post :destroy, :id => t.to_param
      response.status.should == 302
    end
  end

  valid_roles = [:manager,:tech]
  valid_roles.each do |role|
    describe "actions for a #{role}" do
      
      before(:each) do   
        @user = FactoryGirl.build(role)
        @editor = FactoryGirl.build(:editor)
        UsersController.any_instance.stub(:current_user).and_return(@user)
        User.stub(:find).and_return(@user)
        User.stub(:find_by_id).and_return(@user)
        User.stub(:all).and_return([@user,@editor])
      end

      it 'should find list of users for index page' do
        get 'index'
        assigns(:users).should == [@user,@editor]
      end
    end
  end 
end
