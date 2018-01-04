require "spec_helper"
require "capybara/rspec"

feature "Creating a new pet" do

	scenario "Creates a new pet when valid input is provided" do
		tom = User.create!(id: 1, email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')
		click_button("Create A New Pet")
		expect(page).to have_current_path("/users/1/pets/new")
	end

	scenario "Persists a new pet when valid input is provided" do
		tom = User.create!(id: 1, email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')
		click_button("Create A New Pet")

		fill_in("Name", with: "Bunbun")
	#NEED TO SELECT THE ANIMAL TYPE FROM THE DROPDOWN MENU STILL
		fill_in("Bio", with: "Bunbun is a totally rad rabbit who enjoys hopping around and munching on peanuts and carrots")
		fill_in("Zipcode", with: 99999)
		click_button("Create A New Pet")
		expect(page).to have_current_path("/users/1")
		expect(page).to have_content("Bunbun")
	end
end
