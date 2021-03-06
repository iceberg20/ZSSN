require_relative '../spec_helper'

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

RSpec.describe SurvivorsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Survivor. As you add validations to Survivor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurvivorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all survivors as @survivors" do
      survivor = Survivor.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:survivors)).to eq([survivor])
    end
  end

  describe "GET show" do
    it "assigns the requested survivor as @survivor" do
      survivor = Survivor.create! valid_attributes
      get :show, {:id => survivor.to_param}, valid_session
      expect(assigns(:survivor)).to eq(survivor)
    end
  end

  describe "GET new" do
    it "assigns a new survivor as @survivor" do
      get :new, {}, valid_session
      expect(assigns(:survivor)).to be_a_new(Survivor)
    end
  end

  describe "GET edit" do
    it "assigns the requested survivor as @survivor" do
      survivor = Survivor.create! valid_attributes
      get :edit, {:id => survivor.to_param}, valid_session
      expect(assigns(:survivor)).to eq(survivor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Survivor" do
        expect {
          post :create, {:survivor => valid_attributes}, valid_session
        }.to change(Survivor, :count).by(1)
      end

      it "assigns a newly created survivor as @survivor" do
        post :create, {:survivor => valid_attributes}, valid_session
        expect(assigns(:survivor)).to be_a(Survivor)
        expect(assigns(:survivor)).to be_persisted
      end

      it "redirects to the created survivor" do
        post :create, {:survivor => valid_attributes}, valid_session
        expect(response).to redirect_to(Survivor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved survivor as @survivor" do
        post :create, {:survivor => invalid_attributes}, valid_session
        expect(assigns(:survivor)).to be_a_new(Survivor)
      end

      it "re-renders the 'new' template" do
        post :create, {:survivor => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested survivor" do
        survivor = Survivor.create! valid_attributes
        put :update, {:id => survivor.to_param, :survivor => new_attributes}, valid_session
        survivor.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested survivor as @survivor" do
        survivor = Survivor.create! valid_attributes
        put :update, {:id => survivor.to_param, :survivor => valid_attributes}, valid_session
        expect(assigns(:survivor)).to eq(survivor)
      end

      it "redirects to the survivor" do
        survivor = Survivor.create! valid_attributes
        put :update, {:id => survivor.to_param, :survivor => valid_attributes}, valid_session
        expect(response).to redirect_to(survivor)
      end
    end

    describe "with invalid params" do
      it "assigns the survivor as @survivor" do
        survivor = Survivor.create! valid_attributes
        put :update, {:id => survivor.to_param, :survivor => invalid_attributes}, valid_session
        expect(assigns(:survivor)).to eq(survivor)
      end

      it "re-renders the 'edit' template" do
        survivor = Survivor.create! valid_attributes
        put :update, {:id => survivor.to_param, :survivor => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested survivor" do
      survivor = Survivor.create! valid_attributes
      expect {
        delete :destroy, {:id => survivor.to_param}, valid_session
      }.to change(Survivor, :count).by(-1)
    end

    it "redirects to the survivors list" do
      survivor = Survivor.create! valid_attributes
      delete :destroy, {:id => survivor.to_param}, valid_session
      expect(response).to redirect_to(survivors_url)
    end
  end

end
