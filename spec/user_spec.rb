require "rails_helper"

RSpec.describe User, type: :model do
	it { should have_secure_password }
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	it { should have_many(:authentications).dependent(:destroy) }
	it { should have_many(:workshops).dependent(:destroy) }
	it { should have_many(:bookings).dependent(:destroy) }
end