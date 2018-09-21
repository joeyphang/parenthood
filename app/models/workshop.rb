class Workshop < ApplicationRecord
	belongs_to :user
	mount_uploaders :avatar, AvatarUploader

	# scope :title, -> (check_product_title) { where "title ILIKE?", check_product_title }
	# scope :price_range, -> (from,to) {where ("price >= ? AND price <= ?"), from, to}

end
