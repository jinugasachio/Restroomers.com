class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :dresser,         default: 0, null: false
      t.integer :body_mirror,     default: 0, null: false
      t.integer :makeup_mirror,   default: 0, null: false
      t.integer :wifi,            default: 0, null: false
      t.integer :fitting_booth,   default: 0, null: false
      t.integer :washstands,      default: 0, null: false
      t.integer :luggage_storage, default: 0, null: false
      t.integer :outlet,          default: 0, null: false
      t.integer :dust_box,        default: 0, null: false
      t.integer :waiting_sofa,    default: 0, null: false
      t.string :rental
      t.string :others
      t.references :powder_room, foreign_key: true
      t.timestamps
    end
  end
end
