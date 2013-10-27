require 'spec_helper'

describe TextsController do
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

  describe "GET 'create'" do
    it "returns http success" do
      setup
      post 'create', :author => 'The Dude'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    t = FactoryGirl.build(:text)
    t.save!
    it "returns http success" do
      setup
      get 'edit', {:id => t.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    t = FactoryGirl.build(:text)
    t.save!
    it "returns http success" do
      get 'show', {:id => t.to_param}
      response.should be_success
    end
  end

end
