require 'spec_helper'

describe SoundsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    s = FactoryGirl.build(:sound)
    s.save!
    it "returns http success" do
      get 'edit', {:id => s.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    s = FactoryGirl.build(:sound)
    s.save!
    it "returns http success" do
      get 'show', {:id => s.to_param}
      response.should be_success
    end
  end

end
