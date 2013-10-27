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

end
