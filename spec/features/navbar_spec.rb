require "spec_helper"
require "capybara/rspec"

feature "clicking on the nav bar while logged out" do

	scenario "redirects to the sessions new page when the log in link is clicked" do
		visit('/')

		click_link('Log In')
		expect(page).to have_current_path("/sessions/new")
	end

	scenario "redirects to the registration page when the register link is clicked" do
		visit('/')
		click_link('Register')
		expect(page).to have_current_path new_user_path
	end
end

feature "clicking on the navbar when logged in" do

	scenario "redirects to the pets index when the 'all pets' link is clicked" do
		tom = User.create!(id: 1, email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')

		visit("/users/1")

		click_link("All Pets")
		expect(page).to have_current_path("/pets")
	end

	scenario "redirects to the user profile page when the 'user profile' link is clicked and a user is logged in" do
		tom = User.create!(id: 1, email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')

		visit("/users/1")

		click_link("User Profile")
		expect(page).to have_current_path("/users/1")
	end


	scenario "Logs the user out and redirects to root when 'log out' is clicked while a user is logged in" do
		tom = User.create!(id: 1, email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')

		visit("/users/1")

		click_link("Logout")
		expect(page).to have_current_path root_path
	end
end
