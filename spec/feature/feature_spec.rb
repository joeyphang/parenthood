require "rails_helper"

describe "the signin process", type: :feature do
	before :each do
		User.create(first_name: 'Summer', last_name: 'Summer', email: 'summer@email.com', password: 'summer')
	end

	it "signs me in" do
		visit '/signin'
		fill_in 'Email', with: 'summer@email.com'
		fill_in 'Password', with: 'summer'

		click_button 'Sign In'
	end
end