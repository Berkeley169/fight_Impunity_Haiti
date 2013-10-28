require 'spec_helper'

describe Dashboard::ItemsController do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:manager)
  end

  describe "get index" do
  	it "should work" do
  		get :index
  		response.should be_success
  	end
  end

  describe "get new" do
  	it "should work" do
  		get :new
  		response.should be_success
  	end
  end
end