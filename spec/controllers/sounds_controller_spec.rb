require 'spec_helper'

describe SoundsController do
  include Devise::TestHelpers

  def setup(user = :manager)
    sign_in FactoryGirl.create(user)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    s = FactoryGirl.create(:sound)
    it "returns http success" do
      get 'show', {:id => s.to_param}
      response.should be_success
    end
  end

  describe "Get create" do
    it "should redirect to the show page" do
      setup
      post :create, :tag => FactoryGirl.attributes_for(:sound)
      response.status.should == 200
    end
  end

  describe "Get update" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:sound)
      t.save
      post :update, :id => t.to_param, :tag => FactoryGirl.attributes_for(:sound)
      response.status.should == 302
    end
  end

  describe "Get destroy" do
    it "should redirect" do
      setup
      t = FactoryGirl.create(:sound)
      t.save
      post :destroy, :id => t.to_param
      response.status.should == 302
    end
  end

end
