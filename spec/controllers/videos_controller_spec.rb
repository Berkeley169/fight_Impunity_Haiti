require 'spec_helper'

describe VideosController do
  include Devise::TestHelpers

  def setup(user = :manager)
    #@request.env["devise.mapping"] = Devise.mappings[:manager]
    sign_in FactoryGirl.create(user)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    v = FactoryGirl.build(:video)
    v.save!
    it "should work for a manager" do
      setup
      get 'edit', {:id => v.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      v = FactoryGirl.build(:video)
      v.save!
      setup
      get 'show', {:id => v.to_param}
      response.should be_success
    end
  end

  describe "Get create" do
    it "should redirect to the show page" do
      setup
      post :create, :tag => FactoryGirl.attributes_for(:video)
      response.status.should == 200
    end
  end

  describe "Get update" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:video)
      t.save
      post :update, :id => t.to_param, :tag => FactoryGirl.attributes_for(:video)
      response.status.should == 302
    end
  end

  describe "Get destroy" do
    it "should redirect" do
      setup
      t = FactoryGirl.create(:video)
      t.save
      post :destroy, :id => t.to_param
      response.status.should == 302
    end
  end

end
