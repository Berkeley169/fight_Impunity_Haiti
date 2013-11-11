require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TagsController do
  include Devise::TestHelpers

  def setup(user = :manager)
    #@request.env["devise.mapping"] = Devise.mappings[:manager]
    sign_in FactoryGirl.create(user)
  end



  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  describe "GET index" do
    it "should work" do
      setup
      get :index
      response.should be_success
    end
  end

  describe "GET new" do
    it "should work if you have a manager" do
      setup
      get 'new'
      response.status.should be(200)
    end

    it "should not work for an editor" do
      setup(:editor)
      get :new
      response.status.should be(302)
    end

    it "should not work for an the public" do
      get :new
      response.status.should == 302
    end
  end

  describe "GET edit" do
    t = FactoryGirl.build(:tag)
    t.save!
    it "should work if you have a manager" do
      setup
      get :edit, {:id => t.to_param}
      response.status.should be(200)
    end

    it "should not work for an editor" do
      setup(:editor)
      get :edit, {:id => t.to_param}
      response.status.should be(302)
    end

    it "should not work for an the public" do
      get :edit, {:id => t.to_param}
      response.status.should ==302
    end
  end

  describe "GET show" do
    t = FactoryGirl.build(:tag)
    t.save!
    it "should work if you have a manager" do
      setup
      get :show, {:id => t.to_param}
      response.status.should be(200)
    end

    it "should work for an editor" do
      setup(:editor)
      get :show, {:id => t.to_param}
      response.status.should be(200)
    end

    it "should work for the public" do
      get :show, {:id => t.to_param}
      response.status.should be(200)
    end
  end


  describe "Get create" do
    it "should redirect to the show page" do
      setup
      post :create, :tag => FactoryGirl.attributes_for(:tag)
      response.status.should == 302
    end
  end

  describe "Get update" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:tag)
      t.save
      post :update, :id => t.to_param, :tag => FactoryGirl.attributes_for(:tag)
      response.status.should == 302
    end
  end

  describe "Get destroy" do
    it "should redirect to the show page" do
      setup
      t = FactoryGirl.create(:tag)
      t.save
      post :destroy, :id => t.to_param
      response.status.should == 302
    end
  end

end
