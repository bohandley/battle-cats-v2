require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  let!(:user) {User.create!(email: "matt@matt.com", password: "mattmatt")}


  describe "while a user is logged out" do


    it "has a 200 status code when going to new" do
      get :new
      expect(response.status).to eq (200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end
