class Facility < ApplicationRecord
  # Enums
  enum dresser:         { "--": 0, "×": 1, "◯(イスあり)": 2, "◯(イスなし)": 3 }
  enum body_mirror:     { "--": 0, "×": 1, "◯": 2 }
  enum makeup_mirror:   { "--": 0, "×": 1, "◯": 2 }
  enum wifi:            { "--": 0, "×": 1, "◯": 2 }
  enum fitting_booth:   { "--": 0, "×": 1, "◯": 2 }
  enum washstands:      { "--": 0, "×": 1, "◯": 2 }
  enum luggage_storage: { "--": 0, "×": 1, "◯": 2 }
  enum outlet:          { "--": 0, "×": 1, "◯": 2 }
  enum dust_box:        { "--": 0, "×": 1, "◯": 2 }
  enum waiting_sofa:    { "--": 0, "×": 1, "◯": 2 }

  # Association
  belongs_to :powder_room
end
