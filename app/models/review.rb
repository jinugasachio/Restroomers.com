class Review < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :powder_room

  # Validation
  validates :rate,   presence: true, numericality: { only_integer: true }
  validates :review, presence: true, length: { maximum: 1000 }
end
