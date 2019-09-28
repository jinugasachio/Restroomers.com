class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.time :open
      t.time :close
      t.string :phone_number
      t.string :address
      t.text :official_url
      t.integer :membership, default: 0
      t.string :rate_plan
      t.references :powder_room, foreign_key: true
      t.timestamps
    end
  end
end
