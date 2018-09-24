require "rails_helper"

RSpec.describe Workshop, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:bookings).dependent(:destroy) }
end