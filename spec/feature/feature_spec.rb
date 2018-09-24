require "rails_helper"

describe "the signin process", type: :feature do
	before :each do
		User.create(email: 'winter@email.com', password: 'password')
	end

	it "signs me in" do
		visit '/signin'
		fill_in 'Email', with: 'winter@email.com'
		fill_in 'Password', with: 'password'

		click_button 'Sign In'
	end
end