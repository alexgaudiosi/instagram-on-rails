class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts

	def to_param
		name.delete('#')
	end
end

