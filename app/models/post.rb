class Post < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    bucket: 'instagram-clone',
    s3_credentials: {
      access_key_id: Rails.application.secrets.s3_access_key,
      secret_access_key: Rails.application.secrets.s3_secret_key
    }

   	validates :description, presence: true
   	validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

   	has_many :votes
    has_and_belongs_to_many :tags
    has_many :comments
    belongs_to :user

    # geocoded_by :address
    # after_validation :geocode
    # after_save
    # before_save
    # after_create
    # after_update

	def tag_names
		tags.map(&:name).join
	end

	def tag_names=(tag_names)
		tag_names.split(' ').uniq.each do |tag_name|
			tag = Tag.find_or_create_by(name: tag_name)
			tags << tag
		end
	end

  def vote_count
    votes.up.count - votes.down.count
  end
end