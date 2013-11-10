require 'spec_helper'

describe UsersController do

  valid_roles = [:manager,:tech]
  valid_roles.each do |role|
    describe "routing for a #{role}" do
      
      before(:each) do   
        user = FactoryGirl.build(role)
        UsersController.any_instance.stub(:authenticate_user).and_return(user)
        User.stub(:find){user}
        User.stub(:find_by_id){user}
      end
      
      it "index page request returns http success" do
        get("/users").should route_to('users#index')
      end
      it "new user page request returns http success" do
        get("users/new").should route_to('users#new')
      end
      it "edit user page request returns http success" do
        get("/users/0/edit").should route_to('users#edit', :id => "0")
      end
      it "destroy user request redirects to index" do
        get("/users/0/delete").should route_to('users#destroy', :id => "0")
      end
      it "update user page request redirects to index" do
        put("/users/0").should route_to('users#update', :id => "0")
      end
    end 
  end
end
