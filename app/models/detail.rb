class Detail < ApplicationRecord
  enum membership: { "": 0, "会員制": 1 }

  # Association
  belongs_to :powder_room
end
