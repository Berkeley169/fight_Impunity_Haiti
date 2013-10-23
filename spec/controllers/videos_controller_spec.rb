require 'spec_helper'

describe VideosController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    v = FactoryGirl.build(:video)
    v.save!
    it "returns http success" do
      get 'edit', {:id => v.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      v = FactoryGirl.build(:video)
      v.save!
      get 'show', {:id => v.to_param}
      response.should be_success
    end
  end

end
