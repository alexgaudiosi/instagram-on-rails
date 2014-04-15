class Post < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
    # storage: :s3,
    # bucket: 'instagram-feb',
    # s3_credentials: {
    #   access_key_id: Rails.application.secrets.s3_access_key,
    #   secret_access_key: Rails.application.secrets.s3_secret_key
    # }

	def tag_names
		''
	end

	def tag_names=(tag_names)
		raise tag_names
	end
end