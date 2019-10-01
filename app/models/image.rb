class Image < ApplicationRecord
  mount_uploader :urls, ImageUploaderUploader

  # Association
  belongs_to :powder_room

  # Validation
  validates :urls, presence: true
end
