class PowderRoom < ApplicationRecord
  has_ancestry

  # Associations
  belongs_to :user
  has_one :detail
  has_one :facility
  has_many :images
  has_many :likes, dependent: :destroy
end
