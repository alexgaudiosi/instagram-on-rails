class Post < ActiveRecord::Base
	validates :description , presence: true

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
end
