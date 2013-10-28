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

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    s = FactoryGirl.create(:sound)
    it "returns http success" do
      setup
      get 'edit', {:id => s.to_param}
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

end
