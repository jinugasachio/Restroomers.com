class Facility < ApplicationRecord
  # Association
  belongs_to :powder_room

  # Validation
  VALID_MEMBERSHIP_REGEX = /あり|なし/.freeze
  VALID_RATE_PLAN_REGEX = /無料|有料/.freeze
  validates :membership, format: { with: VALID_MEMBERSHIP_REGEX }
  validates :rate_plan,  format: { with: VALID_RATE_PLAN_REGEX }
  validates :others,     length: { maximum: 400 }

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
