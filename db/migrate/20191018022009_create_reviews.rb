class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rate, null: false
      t.text :review, null: false
      t.references :user, foreign_key: true
      t.references :powder_room, foreign_key: true

      t.timestamps
    end
  end
end
