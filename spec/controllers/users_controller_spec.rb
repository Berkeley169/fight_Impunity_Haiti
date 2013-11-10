require 'spec_helper'

describe UsersController do

  include Devise::TestHelpers

  
  
  describe 'should redirect non-manager' do

    it 'should redirect an editor to the dashboard' do
      editor = FactoryGirl.create(:editor)
      editor.save
      sign_in editor
      get :index
      response.should redirect_to root_path
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
      post :create, :tag => FactoryGirl.attributes_for(:manager, :email => "#{Time.now.to_f}@domain.com")
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

      it 'should not have a list of defaults for the new page' do
        get 'new'
        defaults = assigns(:defaults)
        defaults['lang'].values.flatten.reject{|val| val == nil}.length.should == 0
        defaults['role'].values.flatten.reject{|val| val == nil}.length.should == 0
        defaults.delete('lang')
        defaults.delete('role')
        defaults.values.flatten.reject{|val| val == nil}.length.should == 0
      end

      it 'should have a list of defaults for the edit page' do
        get 'edit', :id => 0
        defaults = assigns(:defaults)
        defaults.keys.each do |key|
          if ['lang','role'].include? key
            defaults[key].values.flatten.reject{|val| not val}.length.should == 1
          else
            defaults[key].should_not == nil
          end
        end
      end

    end
  end 
end
