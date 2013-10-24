require 'spec_helper'

describe BinariesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    b = FactoryGirl.build(:binary)
    b.save!
    it "returns http success" do
      get 'edit', {:id => b.to_param}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    b = FactoryGirl.build(:binary)
    b.save!
    it "returns http success" do
      get 'show', {:id => b.to_param}
      response.should be_success
    end
  end

end
