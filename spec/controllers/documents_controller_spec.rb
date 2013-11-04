require 'spec_helper'

describe DocumentsController, :type => :controller do
  include Devise::TestHelpers

  def login(user = :manager)
    sign_in FactoryGirl.create(user)
  end

  before(:each) do
    @b = FactoryGirl.create(:binary, :name => "TestBinary")
    @b.save
    @p = FactoryGirl.create(:picture, :name => "TestPicture")
    @p.save
    @s = FactoryGirl.create(:sound, :name => "TestSound")
    @s.save
    @t = FactoryGirl.create(:text, :name => "TestText")
    @t.save
    @v = FactoryGirl.create(:video, :name => "TestVideo")
    @v.save
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', :type => "pictures"
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success for logged in users" do
      login
      get :edit, :id => @p.id, :type => "pictures"
      response.should be_success
    end

    it "works on any content type" do
      login
      get :edit, :id => @b.id, :type => "binaries"
      response.should be_success
      assigns(:document).class.should == Binary
      get :edit, :id => @p.id, :type => "pictures"
      response.should be_success
      assigns(:document).class.should == Picture
      get :edit, :id => @t.id, :type => "texts"
      response.should be_success
      assigns(:document).class.should == Text
      get :edit, :id => @s.id, :type => "sounds"
      response.should be_success
      assigns(:document).class.should == Sound
      get :edit, :id => @v.id, :type => "videos"
      response.should be_success
      assigns(:document).class.should == Video
    end

    it "disallows the public from editting a document" do
      get :edit, :id => @p.id, :type => "pictures"
      response.should_not be_success
    end
  end

  describe "GET 'show'" do
    it "fetches the proper document and associated langs" do
      get :show, :id => @p.id, :type => "pictures"
      assigns(:document).should == @p
      assigns(:document_langs).should == @p.picture_langs
    end

    it "retrieves the right content types" do
      get :show, :id => @b.id, :type => "binaries"
      assigns(:document).class.should == Binary
      get :show, :id => @p.id, :type => "pictures"
      assigns(:document).class.should == Picture
      get :show, :id => @t.id, :type => "texts"
      assigns(:document).class.should ==Text
      get :show, :id => @s.id, :type => "sounds"
      assigns(:document).class.should == Sound
      get :show, :id => @v.id, :type => "videos"
      assigns(:document).class.should == Video
    end
  end

  describe "GET create", :pending => true do
    it "should redirect to the show page" do
      post :create, :type => "pictures", :picture => {:name => "name", :date => Date.today}
      response.status.should == 200
    end
  end

  describe "GET update" do
    it "should redirect to the show page" do
      login
      post :update, :id => @t.id, :type => "texts", :text => {:name => "NewTestTextName", :date => Date.today}
      response.status.should == 302
    end
   	it "should not publish for editors", :pending => true do
       post :update, :status => 'published', :id => @t.id, :type => "texts", :text => {:name => "NewTestTextName", :date => Date.today}
       response.status.should == 400
   	end
   	it "should publish for managers", :pending => true do
       post :update, :status => 'published', :id => @t.id, :type => "texts", :text => {:name => "NewTestTextName", :date => Date.today}
       response.status.should == 302
   	end
  end

  describe "GET destroy" do
    it "should redirect to the show page" do
      login
      post :destroy, :id => @v.id, :type => "videos"
      response.status.should == 302
    end
  end

  describe "GET index", :pending => true do
  	it "should show all documents with no params" do
  		get :index
  		@docs = assigns(:docs)
  		@docs.should_not be_nil
  		@docs.length.should == 5
  	end
  	it "should show new documents with params type new" do
  		get :index, {:status => 'new'}
  		@docs = assigns(:docs)
  		@docs.should_not be_nil
  		@docs.length.should == 1
  	end
  	it "should show published documerts with params type published" do
  		get :index, {:status => 'published'}
  		@docs = assigns(:docs)
  		@docs.should_not be_nil
  		@docs.length.should == 4
  	end
  end
end
