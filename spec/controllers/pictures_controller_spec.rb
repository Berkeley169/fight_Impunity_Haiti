require 'spec_helper'
include ValidModelConstructors


describe PicturesController do
  include Devise::TestHelpers

  def setup(user = :manager)
    sign_in FactoryGirl.create(user)
  end

	before(:each) do
		@p1 = FactoryGirl.create(:picture)
		@p2 = FactoryGirl.create(:picture)
		@p3 = FactoryGirl.create(:picture)
	end

	describe "index" do
		it "should work" do
			get 'index'
			response.should be_success
		end
	end

	describe "show" do
		it "should work" do
			get :show, :id => @p1.id
			response.should be_success
		end
	end

	describe "new" do
		setup
		it "should work" do
			get :new
			response.should be_success
		end
	end

#   let(:valid_attributes) { { "name" => "MyString" } }
#   let(:valid_session) { {} }
#   describe "GET 'index'" do
#     it "returns http success" do
#       get 'index'
#       response.should be_success
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested picture as @picture" do
#       picture = construct_valid_picture
#       get :show, {:id => picture.to_param}, valid_session
#       assigns(:picture).should eq(picture)
#     end
#   end

#   describe "GET 'new'" do
#     it "returns http success" do
#       get 'new'
#       response.should be_success
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested picture as @picture" do
#       picture = construct_valid_picture
#       get :edit, {:id => picture.to_param}, valid_session
#       assigns(:picture).should eq(picture)
#     end
#   end

# describe "POST create", :pending => true do
#     describe "with valid params" do
#       it "creates a new Picture" do
#         expect {
#           post :create, {:picture => valid_attributes}, valid_session
#         }.to change(Picture, :count).by(1)
#       end

#       it "assigns a newly created picture as @picture" do
#         post :create, {:picture => valid_attributes}, valid_session
#         assigns(:picture).should be_a(Picture)
#         assigns(:picture).should be_persisted
#       end

#       it "redirects to the created picture" do
#         post :create, {:picture => valid_attributes}, valid_session
#         response.should redirect_to(Picture.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved picture as @picture" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Picture.any_instance.stub(:save).and_return(false)
#         post :create, {:picture => { "name" => "invalid value" }}, valid_session
#         assigns(:picture).should be_a_new(Picture)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Picture.any_instance.stub(:save).and_return(false)
#         post :create, {:picture => { "name" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested picture" do
#         picture = construct_valid_picture
#         # Assuming there are no other pictures in the database, this
#         # specifies that the Picture created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Picture.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
#         put :update, {:id => picture.to_param, :picture => { "name" => "MyString" }}, valid_session
#       end

#       it "assigns the requested picture as @picture" do
#         picture = construct_valid_picture
#         put :update, {:id => picture.to_param, :picture => valid_attributes}, valid_session
#         assigns(:picture).should eq(picture)
#       end

#       it "redirects to the picture" do
#         picture = construct_valid_picture
#         put :update, {:id => picture.to_param, :picture => valid_attributes}, valid_session
#         response.should redirect_to(picture)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the picture as @picture" do
#         picture = construct_valid_picture
#         # Trigger the behavior that occurs when invalid params are submitted
#         Picture.any_instance.stub(:save).and_return(false)
#         put :update, {:id => picture.to_param, :picture => { "name" => "invalid value" }}, valid_session
#         assigns(:picture).should eq(picture)
#       end

#       it "re-renders the 'edit' template" do
#         picture = construct_valid_picture
#         # Trigger the behavior that occurs when invalid params are submitted
#         Picture.any_instance.stub(:save).and_return(false)
#         put :update, {:id => picture.to_param, :picture => { "name" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested picture" do
#       picture = construct_valid_picture
#       expect {
#         delete :destroy, {:id => picture.to_param}, valid_session
#       }.to change(Picture, :count).by(-1)
#     end
#   end

end

