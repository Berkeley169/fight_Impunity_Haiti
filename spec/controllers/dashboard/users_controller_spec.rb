require 'spec_helper'

describe Dashboard::UsersController do
  
  describe 'should redirect non-manager' do

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

  valid_roles = [:manager,:tech]
  valid_roles.each do |role|
    describe "actions for a #{role}" do
      
      before(:each) do   
        @user = FactoryGirl.build(role)
        @editor = FactoryGirl.build(:editor)
        Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(@user)
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
