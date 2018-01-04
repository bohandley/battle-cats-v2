require "rails_helper"

describe Pet do

	describe "upon initialization" do

	let(:user) { User.create!(email: "bunbun@bunbun.com", password: "bunbun") }
	let(:pet) { Pet.create!(name: "Bunbun", bio: "Bunbun is a totally rad rabbit", animal_type: "rabbit", zipcode: 12345, owner_id: user.id) }

		it "has a name" do
			expect(pet.name).to eq("Bunbun")
		end

		it "has a bio" do
			expect(pet.bio).to eq("Bunbun is a totally rad rabbit")
		end

		it "has an animal type" do
			expect(pet.animal_type).to eq("rabbit")
		end

		it "has a zipcode" do
			expect(pet.zipcode).to eq(12345)
		end

		it "has an owner_id" do
			expect(pet.owner_id).to eq(user.id)
		end
	end

	describe "when bad input is given" do

		let(:user) { User.create(email: "bunbun@bunbun.com", password: "bunbun")}

		it "must have a name" do
			pet = Pet.new(bio: "wheeeeee!", animal_type: "bat", zipcode: 98765, owner_id: user.id)
			pet.valid?
			expect(pet.errors.count).to be > 0
		end

		it "must have an animal type" do
			pet2 = Pet.new(name: "Batilda", bio: "wheeeeee!", zipcode: 98765, owner_id: user.id)
			pet2.valid?
			expect(pet2.errors.count).to be > 0
		end

		it "cuteness defaults to 2 if no value is provided" do
			pet3 = Pet.new(name: "Batilda", bio: "wheeeee!", zipcode: 98765, owner_id: user.id)
			pet3.valid?
			expect(pet3.errors.count).to be > 0
		end
	end
end