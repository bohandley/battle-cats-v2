require "rails_helper"

describe User, type: :model do

	describe "new user registration" do

		it "should have an email" do
			should validate_presence_of(:email)
		end

		it "should have a password" do
			should validate_presence_of(:password)
		end

		it "should have a secure password" do
			should have_secure_password
		end

	end
end