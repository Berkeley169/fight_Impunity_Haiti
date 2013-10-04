require "spec_helper"

describe PictureLangsController do
  describe "routing" do

    it "routes to #index" do
      get("/picture_langs").should route_to("picture_langs#index")
    end

    it "routes to #new" do
      get("/picture_langs/new").should route_to("picture_langs#new")
    end

    it "routes to #show" do
      get("/picture_langs/1").should route_to("picture_langs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/picture_langs/1/edit").should route_to("picture_langs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/picture_langs").should route_to("picture_langs#create")
    end

    it "routes to #update" do
      put("/picture_langs/1").should route_to("picture_langs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/picture_langs/1").should route_to("picture_langs#destroy", :id => "1")
    end

  end
end
