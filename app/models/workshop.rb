class Workshop < ApplicationRecord
	belongs_to :user
	has_many :bookings, dependent: :destroy
	mount_uploaders :avatar, AvatarUploader

	scope :title, -> (check_workshop_title) { where "title ILIKE?", check_workshop_title }
	# scope :price_range, -> (from,to) {where ("price >= ? AND price <= ?"), from, to}

end
