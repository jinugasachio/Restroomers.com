class Detail < ApplicationRecord
  # Association
  belongs_to :powder_room

  # Validation
  VALID_URL_REGEX   = %r{https?://[\w_.!*\/')(-]+}.freeze
  validates :official_url, format: { with: VALID_URL_REGEX }
end
