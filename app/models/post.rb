class Post < ActiveRecord::Base
	validates :description , presence: true
end
