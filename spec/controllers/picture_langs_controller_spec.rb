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

describe PictureLangsController do

  # This should return the minimal set of attributes required to create a valid
  # PictureLang. As you add validations to PictureLang, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PictureLangsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all picture_langs as @picture_langs" do
      picture_lang = PictureLang.create! valid_attributes
      get :index, {}, valid_session
      assigns(:picture_langs).should eq([picture_lang])
    end
  end

  describe "GET show" do
    it "assigns the requested picture_lang as @picture_lang" do
      picture_lang = PictureLang.create! valid_attributes
      get :show, {:id => picture_lang.to_param}, valid_session
      assigns(:picture_lang).should eq(picture_lang)
    end
  end

  describe "GET new" do
    it "assigns a new picture_lang as @picture_lang" do
      get :new, {}, valid_session
      assigns(:picture_lang).should be_a_new(PictureLang)
    end
  end

  describe "GET edit" do
    it "assigns the requested picture_lang as @picture_lang" do
      picture_lang = PictureLang.create! valid_attributes
      get :edit, {:id => picture_lang.to_param}, valid_session
      assigns(:picture_lang).should eq(picture_lang)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PictureLang" do
        expect {
          post :create, {:picture_lang => valid_attributes}, valid_session
        }.to change(PictureLang, :count).by(1)
      end

      it "assigns a newly created picture_lang as @picture_lang" do
        post :create, {:picture_lang => valid_attributes}, valid_session
        assigns(:picture_lang).should be_a(PictureLang)
        assigns(:picture_lang).should be_persisted
      end

      it "redirects to the created picture_lang" do
        post :create, {:picture_lang => valid_attributes}, valid_session
        response.should redirect_to(PictureLang.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved picture_lang as @picture_lang" do
        # Trigger the behavior that occurs when invalid params are submitted
        PictureLang.any_instance.stub(:save).and_return(false)
        post :create, {:picture_lang => {  }}, valid_session
        assigns(:picture_lang).should be_a_new(PictureLang)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PictureLang.any_instance.stub(:save).and_return(false)
        post :create, {:picture_lang => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested picture_lang" do
        picture_lang = PictureLang.create! valid_attributes
        # Assuming there are no other picture_langs in the database, this
        # specifies that the PictureLang created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PictureLang.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => picture_lang.to_param, :picture_lang => { "these" => "params" }}, valid_session
      end

      it "assigns the requested picture_lang as @picture_lang" do
        picture_lang = PictureLang.create! valid_attributes
        put :update, {:id => picture_lang.to_param, :picture_lang => valid_attributes}, valid_session
        assigns(:picture_lang).should eq(picture_lang)
      end

      it "redirects to the picture_lang" do
        picture_lang = PictureLang.create! valid_attributes
        put :update, {:id => picture_lang.to_param, :picture_lang => valid_attributes}, valid_session
        response.should redirect_to(picture_lang)
      end
    end

    describe "with invalid params" do
      it "assigns the picture_lang as @picture_lang" do
        picture_lang = PictureLang.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PictureLang.any_instance.stub(:save).and_return(false)
        put :update, {:id => picture_lang.to_param, :picture_lang => {  }}, valid_session
        assigns(:picture_lang).should eq(picture_lang)
      end

      it "re-renders the 'edit' template" do
        picture_lang = PictureLang.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PictureLang.any_instance.stub(:save).and_return(false)
        put :update, {:id => picture_lang.to_param, :picture_lang => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested picture_lang" do
      picture_lang = PictureLang.create! valid_attributes
      expect {
        delete :destroy, {:id => picture_lang.to_param}, valid_session
      }.to change(PictureLang, :count).by(-1)
    end

    it "redirects to the picture_langs list" do
      picture_lang = PictureLang.create! valid_attributes
      delete :destroy, {:id => picture_lang.to_param}, valid_session
      response.should redirect_to(picture_langs_url)
    end
  end

end
