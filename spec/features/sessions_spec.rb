require "spec_helper"
require "capybara/rspec"

feature "Visiting the homepage while not logged in" do

	scenario "redirects to the user show page when valid credentials are provided" do
		tom = User.create!( email: "tom@tom.com", password: "tomtom")

		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')

		click_button('Log In')
		expect(page).to have_current_path user_path(tom)
	end

	scenario "redirects back to the login page when erroneous input is provided" do
		tom = User.create!( email: "tom@tom.com", password: "tomtom")
		visit('/')

		fill_in('Email', with: 'fake@bogus.com')
		fill_in('Password', with: 'NOPE')

		click_button('Log In')
		expect(page).to have_current_path("/sessions")
	end


	scenario "redirects back to the login page when a false password is inputted with a valid email" do
		tom = User.create!( email: "tom@tom.com", password: "tomtom")
		visit('/')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'NOPE')

		click_button('Log In')
		expect(page).to have_current_path("/sessions")
	end
end