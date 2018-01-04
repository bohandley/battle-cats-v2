require "spec_helper"
require "capybara/rspec"

feature "Registering as a new user" do

	scenario "redirects to the user show page when valid credentials are provided" do
		visit('/users/new')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')
		fill_in('Password confirmation', with: 'tomtom')

		click_button('Register')
		expect(page).to have_content("Your profile page")
	end

	scenario "redirects back to the login page when false email and password input is provided" do
		visit('/users/new')

		fill_in('Email', with: 'fake@bogus.com')
		fill_in('Password', with: 'NOPE')
		fill_in('Password confirmation', with: "Wrong")

		click_button('Register')
		expect(page).to have_current_path("/users")
	end

	scenario "redirects back to the login page when passwords do not match" do
		visit('/users/new')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'bogus')
		fill_in('Password confirmation', with: "tomtom")

		click_button('Register')
		expect(page).to have_current_path("/users")
	end
end
