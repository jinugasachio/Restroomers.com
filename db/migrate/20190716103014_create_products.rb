class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :image_url
      t.string :manifucturer
      t.integer :internal_capacity
      t.timestamps
    end
  end
end
