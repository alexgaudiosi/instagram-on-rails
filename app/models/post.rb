class Post < ActiveRecord::Base
	validates :description , presence: true

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

	storage: :s3,
    bucket: 'instagram-clone',
    s3_credentials: {
      access_key_id: 'ndcnsjcndfucansh339cjh',
      secret_access_key: '3dod9df9f'
    }

	def tag_names
		''
	end

	def tag_names=(tag_names)
		raise tag_names
	end
end