class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :dresser,         default: '-', null: false
      t.string :body_mirror,     default: '-', null: false
      t.string :makeup_mirror,   default: '-', null: false
      t.string :wifi,            default: '-', null: false
      t.string :fitting_booth,   default: '-', null: false
      t.string :washstands,      default: '-', null: false
      t.string :luggage_storage, default: '-', null: false
      t.string :outlet,          default: '-', null: false
      t.string :dust_box,        default: '-', null: false
      t.string :waiting_sofa,    default: '-', null: false
      t.string :rental
      t.string :others
      t.references :powder_room, foreign_key: true
      t.timestamps
    end
  end
end
