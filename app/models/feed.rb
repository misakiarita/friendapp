class Feed < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :content, 
    length: { minimum: 1}
    belongs_to :user
end
