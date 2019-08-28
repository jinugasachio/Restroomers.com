class CreatePowderRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :powder_rooms do |t|
      t.string :name, null: false
      t.integer :rate, null: false
      t.float :double, :lat, null: false
      t.float :double, :lng, null: false
      t.references :user, foregin_key: true, null: false
      t.timestamps
    end
  end
end
