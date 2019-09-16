class RemoveColumnFromPowderRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :powder_rooms, :double, :float
  end
end
