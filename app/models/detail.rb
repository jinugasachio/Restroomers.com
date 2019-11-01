class Detail < ApplicationRecord
  # Association
  belongs_to :powder_room

  # Validation
  # VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/.freeze # 10桁か11桁の数字(ハイフンなし)
  VALID_URL_REGEX   = %r{https?://[\w_.!*\/')(-]+}.freeze

  # validates :phone_number, format: { with: VALID_PHONE_REGEX }
  validates :official_url, format: { with: VALID_URL_REGEX }
end
