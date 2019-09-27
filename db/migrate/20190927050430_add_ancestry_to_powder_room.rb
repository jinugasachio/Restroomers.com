class AddAncestryToPowderRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :powder_rooms, :ancestry, :string
    add_index :powder_rooms, :ancestry
  end
end
