class Review < ApplicationRecord
  belongs_to :user
  belomgs_to :powder_room

  validates :rate, presence: true
  validates :review, presence: true
end
