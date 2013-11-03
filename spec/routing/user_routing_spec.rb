require 'spec_helper'

describe Dashboard::UsersController do

  valid_roles = [:manager,:tech]
  valid_roles.each do |role|
    describe "routing for a #{role}" do
      
      before(:each) do   
        user = FactoryGirl.build(role)
        Dashboard::UsersController.any_instance.stub(:authenticate_user).and_return(user)
        User.stub(:find){user}
        User.stub(:find_by_id){user}
      end
      
      it "index page request returns http success" do
        get("/dashboard/users").should route_to('dashboard/users#index')
      end
      it "new user page request returns http success" do
        get("/dashboard/users/new").should route_to('dashboard/users#new')
      end
      it "edit user page request returns http success" do
        get("/dashboard/users/0/edit").should route_to('dashboard/users#edit', :id => "0")
      end
      it "destroy user request redirects to index" do
        get("/dashboard/users/0/destroy").should route_to('dashboard/users#destroy', :id => "0")
      end
      it "update user page request redirects to index" do
        get("/dashboard/users/0/update").should route_to('dashboard/users#update', :id => "0")
      end
    end 
  end
end