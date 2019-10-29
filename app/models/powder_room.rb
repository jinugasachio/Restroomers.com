class PowderRoom < ApplicationRecord
  has_ancestry

  # Associations
  belongs_to :user
  has_one :detail
  has_one :facility
  has_many :images
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Validation
  validates :name, presence: true
  validates :lat,  presence: true, numericality: true
  validates :lng,  presence: true, numericality: true
end
