require 'spec_helper'

describe PicturesController do
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

  describe "GET 'edit'" do
    t = FactoryGirl.build(:picture)
    t.save!
    it "returns http success" do
      setup
      get 'edit', {:id => t.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    t = FactoryGirl.build(:picture)
    t.save!
    it "returns http success" do
      get 'show', {:id => t.to_param}
      response.should be_success
    end
  end

  describe "Get create" do
    it "should redirect to the show page" do
      setup
      post :create, :picture => {:name => "name", :date => Date.today}
      response.status.should == 200
    end
  end

  describe "Get update" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:picture)
      t.save
      post :update, :id => t.to_param, :picture => {:name => "name", :date => Date.today}
      response.status.should == 302
    end
  end

  describe "Get destroy" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:picture)
      t.save
      post :destroy, :id => t.to_param
      response.status.should == 302
    end
  end

end
