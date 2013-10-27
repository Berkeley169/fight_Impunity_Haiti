require 'spec_helper'

describe TextsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    t = FactoryGirl.build(:text)
    t.save!
    it "returns http success" do
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
