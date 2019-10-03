class Facility < ApplicationRecord
  enum membership: { "特になし": 0, "会員制": 1 }

  # Association
  belongs_to :powder_room
end
