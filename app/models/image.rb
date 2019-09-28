class Image < ApplicationRecord
  mount_uploaders :urls, ImageUploader
end
