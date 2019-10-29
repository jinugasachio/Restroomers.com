class Facility < ApplicationRecord
  # Association
  belongs_to :powder_room

  # Validation
  validates :dresser,
            :body_mirror,
            :makeup_mirror,
            :wifi,
            :fitting_booth,
            :washstands,
            :luggage_storage,
            :outlet,
            :dust_box,
            :waiting_space,
            :others,
            :membership,
            :rate_plan, presence: true
end
