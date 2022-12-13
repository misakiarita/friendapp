class Feed < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :content, :title,
    length: { minimum: 1}
    belongs_to :user
end
