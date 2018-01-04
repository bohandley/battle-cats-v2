require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let!(:user) {User.create!(id: 1, email: "matt@matt.com", password: "mattmatt")}

  before(:each) do
    session[:user_id] = 1
  end

  it "has a 200 status code" do
    get :new
    expect(response.status).to eq (200)
  end

  it "assigns a new user to @user" do
    get :new
    expect(assigns(:user)).to be_a_new User
  end

  it "renders the new template" do
    get :new
    expect(response).to render_template("new")
  end

  it "renders the show template" do
    get :show, params: { id: user.id }
    expect(response).to render_template("show")
  end

  it "assigns current user as @user" do
    get :show, params: { id: user.id }
    expect(assigns(:user)).to eq(user)
  end

  describe "POST #create" do
    context "when valid params are passed" do
      context "when valid params are passed" do
        it "responds with status code 302" do
          post :create, params: { user: {email: "one@one.com", password: "password"} }
          expect(response).to have_http_status 302
        end

        it "creates a new user in the database" do
          expect {
            post :create, params: { user: {email: "one@one.com", password: "password"} }
          }.to change { User.count}
        end

        it "assigns the newly created user as @user" do
          post :create, params: { user: {email: "one@one.com", password: "password"} }
          expect(assigns(:user)).to be_instance_of(User)
        end

        it "renders show page" do
          post :create, params: { user: {email: "one@one.com", password: "password"} }
          new_user = assigns(:user)
          expect(response).to redirect_to(user_path(new_user.id))
        end
      end

      context "when invalid params are passed" do

        it "does not create a new user in the database" do
          expect {
            post :create, params: { user: {email: "one@one.com", password: ""} }
          }.to_not change { User.count}
        end

        it "assigns the unsaved user as @user" do
          post :create, params: { user: {email: "one@one.com", password: ""} }
          expect(assigns(:user)).to be_instance_of(User)
        end

        it "renders the :new template" do
          post :create, params: { user: {email: "one@one.com", password: ""} }
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
