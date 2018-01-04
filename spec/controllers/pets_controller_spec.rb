require "rails_helper"
require "rack/test"
require 'pp'

RSpec.describe PetsController, type: :controller do

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}

  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", owner: user)}
  let!(:pet_2) {Pet.create(name: "Puff", animal_type: "Cat", bio: "a cute Cat", zipcode: "60192", owner: user)}

  let!(:vote_1) {Vote.create(pet_id: pet.id, user_id: 2)}
  let!(:vote_2) {Vote.create(pet_id: pet.id, user_id: 3)}


  before(:each) do
    session[:user_id] = user.id
  end

  describe "Get # index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq (200)
    end

    it "has a collection of pets objects" do
      get :index
      expect(assigns(:pets)).to all(be_a Pet)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Get # view " do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq (200)
    end

    it "create a new pet" do
      get :new
      expect(assigns(:pet)).to be_a_new Pet
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do

        post :create,  params: { "user_id" => user.id, pet: {name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192"}}

        pet_new = assigns(:pet)
        expect(pet_new.persisted?).to be true
      end

    end
  end

  describe "routes for pets", :type => :routing do

    let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192")}
    it "routes /pets to /pets/:id action " do

      expect(get("/pets/1")).to route_to(controller: "pets",
        action: "show",
        id: "1")

    end

    it "routes /users/:user_id/pets  to create a pet " do

      expect(post("/users/1/pets")).to route_to(controller: "pets",
        action: "create",
        user_id: "1")

    end
   end
   # add tests for vote
   describe "Put # vote " do

    it "has a 200 status code" do
      put :vote, params: { id: pet.id}
      expect(response.status).to eq (200)
    end

    it "adds a vote" do
      put :vote, params: { id: pet.id}

      vote_new = assigns(:vote_1)
      expect(pet.votes.first).to be_a_kind_of(Vote)
    end

    it "adds a vote" do
      expect {
      put :vote, params: { id: pet.id} }.to change { Vote.count}
    end

    it "renders the show template" do
      put :vote, params: { id: pet.id}
      expect(response).to render_template(:show)
    end

    it "renders the vote template if json" do
      put :vote, params: { id: pet.id}, :format => 'js'
      expect(response).to render_template(:vote)
    end
  end
  describe "count # of votes " do

    it "has total of votes" do
      expect(pet.votes.count).to eq (2)
    end
  end

  describe "DELETE #destroy" do

    it "deletes a pet" do
      puts user.pets.count
      expect {
        delete :destroy, params: {id: pet.id }}.to change {user.pets.count}

    end

    it "has destroyed a pet" do
      pet_2.destroy
      expect(user.pets.count).to eq(1)
    end
  end
  # edit tests
  describe "edit_pet GET" do

    it "has a 200 status code" do
      get :edit, params: {id:pet.id}
      expect(response.status).to eq (200)
    end

    it "renders the edit template" do
      get :edit, params: {id:pet.id}
      expect(response).to render_template(:edit)
    end
  end

  #update tests
  describe "Update tests" do
    context "when valid params are passed" do
      it "responds with status code 302" do

        put :update,  params: { id: pet.id, pet: {name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192"}}

        pet_new = assigns(:pet)
        expect(pet_new.persisted?).to be true
      end

      it "renders the show template" do
        put :update,  params: { id: pet.id, pet: {name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192"}}
        pet_new = assigns(:pet)
        expect(pet_new.persisted?).to render_template(:show)
      end

      it "renders the edit template if not saved" do
        put :update,  params: { id: pet.id, pet: { name: nil, animal_type: "Zee", bio: "a cute Zee", zipcode: "60192"}}
        pet_new = assigns(:pet)
        expect(!pet_new.persisted?).to render_template(:edit)
      end
    end
  end


end



